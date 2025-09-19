#!/bin/bash

# Script de surveillance des assets pour mise à jour automatique
# Fractal Innov Assets Repository

echo "👀 Surveillance des assets Fractal Innov"
echo "========================================"
echo ""

# Vérifier si Node.js est installé
if ! command -v node &> /dev/null; then
    echo "❌ Node.js n'est pas installé"
    echo "Installez Node.js depuis https://nodejs.org/"
    exit 1
fi

# Vérifier si le script de génération existe
if [ ! -f "generate-indexes.js" ]; then
    echo "❌ Script generate-indexes.js non trouvé"
    exit 1
fi

echo "✅ Node.js détecté"
echo "✅ Script de génération trouvé"
echo ""

# Fonction de génération
generate_indexes() {
    echo "🔄 Génération des index.html..."
    node generate-indexes.js
    echo "✅ Index mis à jour"
    echo ""
}

# Génération initiale
generate_indexes

# Surveillance des changements
echo "👀 Surveillance des changements dans le dossier assets/..."
echo "Appuyez sur Ctrl+C pour arrêter"
echo ""

# Utiliser inotifywait si disponible (Linux)
if command -v inotifywait &> /dev/null; then
    echo "📁 Utilisation d'inotifywait pour la surveillance..."
    inotifywait -m -r -e create,delete,moved_to,modify assets/ | while read path action file; do
        echo "📝 Changement détecté: $action $file dans $path"
        generate_indexes
    done
# Utiliser fswatch si disponible (macOS)
elif command -v fswatch &> /dev/null; then
    echo "📁 Utilisation de fswatch pour la surveillance..."
    fswatch -o assets/ | while read; do
        echo "📝 Changement détecté dans assets/"
        generate_indexes
    done
# Fallback: surveillance par polling
else
    echo "📁 Utilisation du polling pour la surveillance..."
    echo "⚠️  Pour une surveillance en temps réel, installez inotifywait (Linux) ou fswatch (macOS)"

    last_modified=$(find assets/ -type f -exec stat -c %Y {} \; 2>/dev/null | sort -n | tail -1)

    while true; do
        sleep 5
        current_modified=$(find assets/ -type f -exec stat -c %Y {} \; 2>/dev/null | sort -n | tail -1)

        if [ "$current_modified" != "$last_modified" ]; then
            echo "📝 Changement détecté dans assets/"
            generate_indexes
            last_modified=$current_modified
        fi
    done
fi
