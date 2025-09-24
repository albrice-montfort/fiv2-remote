#!/bin/bash

# Script de déploiement simple pour GitHub Pages
# Fractal Innov Assets Repository

echo "🚀 Déploiement simple vers GitHub Pages"
echo "======================================"

# Vérifier si Git est initialisé
if [ ! -d ".git" ]; then
    echo "📦 Initialisation du repository Git..."
    git init
    echo "✅ Repository Git initialisé"
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

# Ajouter tous les fichiers
echo "📁 Ajout des fichiers au repository..."
git add .

# Vérifier s'il y a des changements
if git diff --staged --quiet; then
    echo "ℹ️  Aucun changement détecté"
    echo "💡 Le workflow GitHub Actions se déclenchera automatiquement"
else
    # Commit des changements
    echo "💾 Création du commit..."
    git commit -m "🔄 Update assets and indexes

- Mise à jour des fichiers de configuration
- Ajout de nouveaux assets
- Génération automatique des index.html
- Workflow GitHub Actions simplifié

Déployé automatiquement le $(date)"

    echo "✅ Commit créé avec succès"

    # Push vers GitHub
    echo "🌐 Déploiement sur GitHub Pages..."
    git push origin main

    if [ $? -eq 0 ]; then
        echo "✅ Déploiement réussi !"
        echo ""
        echo "🔄 Le workflow GitHub Actions va maintenant :"
        echo "   1. Générer automatiquement les index.html"
        echo "   2. Déployer sur GitHub Pages"
        echo ""
        echo "🔗 Votre site sera disponible à :"
        echo "   https://albrice-montfort.github.io/fiv2-remote/"
        echo ""
        echo "📊 Pages des assets :"
        echo "   https://albrice-montfort.github.io/fiv2-remote/assets/hdri/"
        echo "   https://albrice-montfort.github.io/fiv2-remote/assets/models/"
        echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/"
        echo ""
        echo "⏱️  Le déploiement peut prendre 2-3 minutes pour être visible"
        echo "📈 Suivez le progrès dans l'onglet 'Actions' de votre repository GitHub"
    else
        echo "❌ Erreur lors du déploiement"
        echo "Vérifiez votre configuration Git et vos permissions GitHub"
        echo ""
        echo "💡 Solutions possibles :"
        echo "   1. Utilisez GitHub Desktop pour pousser les changements"
        echo "   2. Configurez un token d'accès personnel"
        echo "   3. Utilisez SSH au lieu de HTTPS"
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
echo "🔧 Workflow GitHub Actions :"
echo "   - Workflow simple: .github/workflows/simple-deploy.yml"
