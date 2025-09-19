#!/bin/bash

# Script de déploiement automatique pour GitHub Pages
# Fractal Innov Assets Repository

echo "🚀 Déploiement des assets Fractal Innov sur GitHub Pages"
echo "========================================================"

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
    git commit -m "🔄 Update assets repository

- Mise à jour des fichiers de configuration
- Ajout de nouveaux assets
- Amélioration de la documentation
- Test de disponibilité des assets

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
else
    echo "ℹ️  Aucun changement à déployer"
fi

echo ""
echo "📊 URLs des assets disponibles :"
echo "================================"
echo ""
echo "🎨 Modèles 3D :"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/models/heavy-models/Fiv2_06M.glb"
echo ""
echo "🖼️  Textures HD :"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI01_2k.PNG"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI01A_2k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI02_2k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI03_2k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI04_2k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI05_2k.PNG"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI06_2k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI07_2k.PNG"
echo ""
echo "🎯 Utilisation dans votre projet :"
echo "   Base URL: https://albrice-montfort.github.io/fiv2-remote/"
