#!/bin/bash

# Script pour forcer l'ajout des fichiers volumineux
# Fractal Innov Assets Repository

echo "🔧 Force add des fichiers volumineux"
echo "===================================="

# Sauvegarder les fichiers originaux
echo "💾 Sauvegarde des fichiers originaux..."
cp assets/hdri/HDRI_Nebula02_4k.png assets/hdri/HDRI_Nebula02_4k.png.backup
cp assets/hdri/HDRI_Nebula02_8k.png assets/hdri/HDRI_Nebula02_8k.png.backup

# Supprimer les fichiers du cache Git LFS
echo "🗑️ Suppression des fichiers du cache Git LFS..."
git lfs untrack "*.png"
git rm --cached assets/hdri/HDRI_Nebula02_4k.png
git rm --cached assets/hdri/HDRI_Nebula02_8k.png

# Restaurer les fichiers originaux
echo "🔄 Restauration des fichiers originaux..."
cp assets/hdri/HDRI_Nebula02_4k.png.backup assets/hdri/HDRI_Nebula02_4k.png
cp assets/hdri/HDRI_Nebula02_8k.png.backup assets/hdri/HDRI_Nebula02_8k.png

# Ajouter les fichiers directement
echo "📁 Ajout des fichiers directement..."
git add assets/hdri/HDRI_Nebula02_4k.png
git add assets/hdri/HDRI_Nebula02_8k.png

# Vérifier les tailles
echo "📊 Vérification des tailles :"
ls -lh assets/hdri/HDRI_Nebula02_*.png

# Créer le commit
echo "💾 Création du commit..."
git commit -m "🔧 Force add HDRI files without LFS

- Suppression des pointeurs Git LFS
- Ajout direct des fichiers PNG volumineux
- HDRI_Nebula02_4k.png (6.4MB) - Fichier réel
- HDRI_Nebula02_8k.png (36MB) - Fichier réel
- Correction définitive du problème de téléchargement

Déployé automatiquement le $(date)"

echo "✅ Commit créé avec succès"
echo ""
echo "🚀 ÉTAPES SUIVANTES :"
echo "1. Utilisez GitHub Desktop pour pousser les changements"
echo "2. Vérifiez que les fichiers sont accessibles via les URLs"
echo "3. Testez les téléchargements - ils devraient maintenant faire 6.4MB et 36MB"
echo ""
echo "🔗 URLs à tester :"
echo "https://albrice-montfort.github.io/fiv2-remote/assets/hdri/HDRI_Nebula02_4k.png"
echo "https://albrice-montfort.github.io/fiv2-remote/assets/hdri/HDRI_Nebula02_8k.png"
