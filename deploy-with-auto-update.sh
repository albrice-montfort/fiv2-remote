#!/bin/bash

# Script de déploiement avec mise à jour automatique des index
# Fractal Innov Assets Repository

echo "🚀 Déploiement avec mise à jour automatique des index"
echo "===================================================="

# Vérifier si Node.js est installé
if ! command -v node &> /dev/null; then
    echo "❌ Node.js n'est pas installé"
    echo "Installez Node.js depuis https://nodejs.org/"
    exit 1
fi

# Générer les index automatiquement
echo "🔄 Génération automatique des index.html..."
node generate-indexes.js

if [ $? -eq 0 ]; then
    echo "✅ Index générés avec succès"
else
    echo "❌ Erreur lors de la génération des index"
    exit 1
fi

# Vérifier si Git est initialisé
if [ ! -d ".git" ]; then
    echo "📦 Initialisation du repository Git..."
    git init
    echo "✅ Repository Git initialisé"
fi

# Ajouter tous les fichiers
echo "📁 Ajout des fichiers au repository..."
git add .

# Vérifier s'il y a des changements
if git diff --staged --quiet; then
    echo "ℹ️  Aucun changement détecté"
else
    # Commit des changements
    echo "💾 Création du commit..."
    git commit -m "🔄 Auto-update assets repository

- Mise à jour automatique des index.html
- Ajout de nouveaux assets
- Génération des listes de fichiers
- Amélioration de la documentation

Déployé automatiquement le $(date)"

    echo "✅ Commit créé avec succès"

    # Push vers GitHub
    echo "🌐 Déploiement sur GitHub Pages..."
    git push origin main

    if [ $? -eq 0 ]; then
        echo "✅ Déploiement réussi !"
        echo ""
        echo "🔗 Votre site est disponible à :"
        echo "   https://albrice-montfort.github.io/fiv2-remote/"
        echo ""
        echo "🧪 Page de test des assets :"
        echo "   https://albrice-montfort.github.io/fiv2-remote/test-assets.html"
        echo ""
        echo "⏱️  Le déploiement peut prendre 1-2 minutes pour être visible"
    else
        echo "❌ Erreur lors du déploiement"
        echo "Vérifiez votre configuration Git et vos permissions GitHub"
    fi
fi

echo ""
echo "📊 Assets détectés :"
echo "==================="

# Afficher les assets détectés
for category in models textures hdri audio; do
    if [ -d "assets/$category" ]; then
        count=$(find "assets/$category" -type f \( -name "*.glb" -o -name "*.gltf" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" -o -name "*.ktx2" -o -name "*.hdr" -o -name "*.exr" -o -name "*.mp3" -o -name "*.wav" -o -name "*.ogg" -o -name "*.m4a" \) | wc -l)
        if [ $count -gt 0 ]; then
            echo "📁 $category: $count fichiers"
        fi
    fi
done

echo ""
echo "🎯 Utilisation dans votre projet :"
echo "   Base URL: https://albrice-montfort.github.io/fiv2-remote/"
echo ""
echo "💡 Pour la surveillance automatique :"
echo "   ./watch-assets.sh"
