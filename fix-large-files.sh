#!/bin/bash

# Script pour résoudre le problème des fichiers volumineux
# Fractal Innov Assets Repository

echo "🔧 Résolution du problème des fichiers volumineux"
echo "================================================"

# Vérifier si Git LFS est installé
if ! command -v git-lfs &> /dev/null; then
    echo "❌ Git LFS n'est pas installé"
    echo "Installez Git LFS depuis https://git-lfs.github.io/"
    exit 1
fi

echo "✅ Git LFS détecté"

# Désactiver Git LFS pour les fichiers PNG temporairement
echo "🔄 Désactivation temporaire de Git LFS pour les PNG..."
git lfs untrack "*.png"

# Ajouter les fichiers PNG directement
echo "📁 Ajout des fichiers PNG directement..."
git add assets/hdri/HDRI_Nebula02_4k.png
git add assets/hdri/HDRI_Nebula02_8k.png

# Vérifier la taille des fichiers
echo "📊 Vérification des tailles de fichiers :"
ls -lh assets/hdri/HDRI_Nebula02_*.png

# Créer un commit
echo "💾 Création du commit..."
git commit -m "🔧 Fix large files: Add HDRI files directly

- Désactivation temporaire de Git LFS pour les PNG
- Ajout direct des fichiers HDRI volumineux
- HDRI_Nebula02_4k.png (6.7MB)
- HDRI_Nebula02_8k.png (38MB)

Déployé automatiquement le $(date)"

echo "✅ Commit créé avec succès"
echo ""
echo "🚀 ÉTAPES SUIVANTES :"
echo "1. Utilisez GitHub Desktop pour pousser les changements"
echo "2. Vérifiez que les fichiers sont accessibles via les URLs"
echo "3. Testez les téléchargements"
echo ""
echo "🔗 URLs à tester :"
echo "https://albrice-montfort.github.io/fiv2-remote/assets/hdri/HDRI_Nebula02_4k.png"
echo "https://albrice-montfort.github.io/fiv2-remote/assets/hdri/HDRI_Nebula02_8k.png"
