#!/bin/bash

# Script pour vérifier les fichiers volumineux et leur statut LFS
# Fractal Innov Assets Repository

echo "🔍 Vérification des fichiers volumineux..."
echo "========================================="

# Vérifier la configuration Git LFS
echo "📋 Configuration Git LFS :"
git lfs env | head -10

echo ""
echo "📁 Fichiers suivis par LFS :"
git lfs ls-files

echo ""
echo "📊 Taille des fichiers GLB locaux :"
find assets -name "*.glb" -exec ls -lh {} \;

echo ""
echo "🔍 Statut des fichiers volumineux :"
find assets -name "*.glb" -exec echo "Fichier: {}" \; -exec file {} \;

echo ""
echo "🌐 Vérification des URLs de téléchargement :"
echo "============================================="

# Test de quelques URLs pour vérifier la taille
echo "Test des URLs GitHub Pages..."

base_url="https://albrice-montfort.github.io/fiv2-remote"

# Tester le fichier chunks
chunk_url="$base_url/assets/chunks/Fiv2_Chunk_MandelBulb.glb"
echo ""
echo "🧩 Test: $chunk_url"
curl -sI "$chunk_url" | grep -E "(Content-Length|content-length)" || echo "❌ Impossible de récupérer la taille"

# Tester un fichier modèle connu
model_url="$base_url/assets/models/heavy-models/Fiv2_06M.glb"
echo ""
echo "🎨 Test: $model_url"
curl -sI "$model_url" | grep -E "(Content-Length|content-length)" || echo "❌ Impossible de récupérer la taille"

echo ""
echo "💡 Instructions pour corriger :"
echo "================================"
echo "1. Utilisez GitHub Desktop pour pousser les changements"
echo "2. Ou configurez l'authentification Git avec un token"
echo "3. Le workflow GitHub Actions se déclenchera automatiquement"
echo "4. Attendez 2-3 minutes pour la mise à jour des pages"

echo ""
echo "🔧 Si le problème persiste :"
echo "  - Les fichiers LFS peuvent prendre plus de temps à se synchroniser"
echo "  - Vérifiez les quotas LFS de votre repository GitHub"
echo "  - Consultez l'onglet 'Actions' de votre repository pour voir les logs"
