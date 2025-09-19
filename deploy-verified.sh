#!/bin/bash

# Script de déploiement avec vérification complète des URLs
# Fractal Innov Assets Repository

echo "🚀 Déploiement avec vérification complète des URLs"
echo "================================================="

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

# Vérifier les URLs
echo "🔍 Vérification des URLs..."
node verify-urls.js

if [ $? -eq 0 ]; then
    echo "✅ Toutes les URLs sont correctes"
else
    echo "❌ Des erreurs d'URL ont été détectées"
    exit 1
fi

# Afficher les assets détectés
echo ""
echo "📊 Assets détectés et vérifiés :"
echo "==============================="

for category in models textures hdri audio; do
    if [ -d "assets/$category" ]; then
        count=$(find "assets/$category" -type f \( -name "*.glb" -o -name "*.gltf" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" -o -name "*.ktx2" -o -name "*.hdr" -o -name "*.exr" -o -name "*.mp3" -o -name "*.wav" -o -name "*.ogg" -o -name "*.m4a" \) | wc -l)
        if [ $count -gt 0 ]; then
            echo "📁 $category: $count fichiers ✅"
            find "assets/$category" -type f \( -name "*.glb" -o -name "*.gltf" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" -o -name "*.ktx2" -o -name "*.hdr" -o -name "*.exr" -o -name "*.mp3" -o -name "*.wav" -o -name "*.ogg" -o -name "*.m4a" \) | sed 's/^/   - /'
        else
            echo "📁 $category: 0 fichiers (vide) ✅"
        fi
    fi
done

echo ""
echo "🎯 URLs vérifiées et fonctionnelles :"
echo "===================================="
echo ""
echo "🌌 Environnements HDRI :"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/hdri/"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/hdri/HDRI_Nebula02_4k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/hdri/HDRI_Nebula02_8k.png"
echo ""
echo "🖼️  Textures HD :"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI01A_2k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI02_2k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI03_2k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI04_2k.png"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI06_2k.png"
echo ""
echo "🎨 Modèles 3D :"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/models/heavy-models/"
echo "   https://albrice-montfort.github.io/fiv2-remote/assets/models/heavy-models/Fiv2_06M.glb"
echo ""
echo "🧪 Pages de test :"
echo "   https://albrice-montfort.github.io/fiv2-remote/test-all-urls.html"
echo "   https://albrice-montfort.github.io/fiv2-remote/test-assets.html"
echo ""
echo "🎯 Base URL pour votre code :"
echo "   https://albrice-montfort.github.io/fiv2-remote/"
echo ""
echo "✅ PRÊT POUR LE DÉPLOIEMENT !"
echo "💡 Toutes les URLs sont correctes et fonctionnelles"
echo "🚀 Utilisez GitHub Desktop pour pousser les changements"
