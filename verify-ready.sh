#!/bin/bash

# Script de vérification avant déploiement
# Fractal Innov Assets Repository

echo "🔍 Vérification avant déploiement"
echo "================================="

# Vérifier la structure des dossiers
echo "📁 Structure des dossiers :"
for category in models textures hdri audio chunks; do
    if [ -d "assets/$category" ]; then
        count=$(find "assets/$category" -type f \( -name "*.glb" -o -name "*.gltf" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" -o -name "*.ktx2" -o -name "*.hdr" -o -name "*.exr" -o -name "*.mp3" -o -name "*.wav" -o -name "*.ogg" -o -name "*.m4a" \) | wc -l)
        echo "   ✅ $category: $count fichiers"
    else
        echo "   ❌ $category: dossier manquant"
    fi
done

echo ""
echo "📄 Fichiers index.html :"
for category in models textures hdri audio chunks; do
    if [ -f "assets/$category/index.html" ]; then
        echo "   ✅ assets/$category/index.html"
    else
        echo "   ❌ assets/$category/index.html manquant"
    fi
done

echo ""
echo "🔧 Workflow GitHub Actions :"
if [ -f ".github/workflows/simple-deploy.yml" ]; then
    echo "   ✅ .github/workflows/simple-deploy.yml"
else
    echo "   ❌ .github/workflows/simple-deploy.yml manquant"
fi

echo ""
echo "📊 État Git :"
echo "   Branche actuelle: $(git branch --show-current)"
echo "   Dernier commit: $(git log --oneline -1)"
echo "   Fichiers modifiés: $(git status --porcelain | wc -l)"

echo ""
echo "🌐 Configuration remote :"
if git remote get-url origin &> /dev/null; then
    echo "   ✅ Remote origin: $(git remote get-url origin)"
else
    echo "   ❌ Aucun remote origin configuré"
fi

echo ""
echo "📋 Instructions de déploiement :"
echo "   1. Ouvrez GitHub Desktop"
echo "   2. Cliquez sur 'Commit to main' puis 'Push origin'"
echo "   3. Attendez que le workflow GitHub Actions se termine"
echo "   4. Vérifiez https://albrice-montfort.github.io/fiv2-remote/assets/chunks/"

echo ""
echo "🎯 URLs de test après déploiement :"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/hdri/"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/chunks/"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/models/"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/"

echo ""
echo "✅ Vérification terminée !"
echo "💡 Utilisez GitHub Desktop pour pousser les changements vers GitHub"
