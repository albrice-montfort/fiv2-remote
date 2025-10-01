# 🔄 Guide du Bouton "Refresh Detected Files"

## ✨ Fonctionnalité Ajoutée

Chaque page d'assets dispose maintenant d'un bouton **"🔄 Refresh Files"** qui permet de détecter et afficher les nouveaux fichiers en temps réel, sans attendre un nouveau déploiement GitHub Pages.

## 🎯 Localisation

Le bouton se trouve **en haut à droite** de chaque page d'assets :
- `https://albrice-montfort.github.io/fiv2-remote/assets/chunks/`
- `https://albrice-montfort.github.io/fiv2-remote/assets/hdri/`
- `https://albrice-montfort.github.io/fiv2-remote/assets/models/`
- `https://albrice-montfort.github.io/fiv2-remote/assets/textures/`
- `https://albrice-montfort.github.io/fiv2-remote/assets/audio/`

## 🚀 Comment ça fonctionne

### 1. **Détection automatique**
- Utilise l'API GitHub pour scanner le dossier en temps réel
- Récupère la liste des fichiers directement depuis le repository
- Filtre automatiquement par type de fichier supporté

### 2. **Mise à jour dynamique**
- Met à jour le contenu de la page sans rechargement
- Affiche les vraies tailles des fichiers depuis GitHub
- Interface fluide avec animations et feedback visuel

### 3. **Gestion des erreurs**
- Messages d'erreur clairs en cas de problème
- Fallback gracieux si l'API GitHub n'est pas accessible
- Indicateur de chargement pendant le scan

## 📋 Instructions d'utilisation

### **Étape 1 : Ajouter des fichiers**
```bash
# Ajoutez vos nouveaux fichiers GLB/GLTF dans le dossier
cp nouveau_fichier.glb assets/chunks/

# Committez et poussez vers GitHub
git add assets/chunks/nouveau_fichier.glb
git commit -m "Add new chunk file"
git push origin main
```

### **Étape 2 : Utiliser le bouton Refresh**
1. Allez sur la page d'assets concernée
2. Cliquez sur le bouton **"🔄 Refresh Files"** en haut à droite
3. Attendez le scan (quelques secondes)
4. Vos nouveaux fichiers apparaissent immédiatement !

## 🔧 Types de fichiers supportés

### **Chunks** (`.glb`, `.gltf`)
- Fragments et éléments 3D modulaires
- Icône : 🧩

### **Models** (`.glb`, `.gltf`)
- Modèles 3D complets
- Icône : 🎨

### **Textures** (`.png`, `.jpg`, `.jpeg`, `.webp`, `.ktx2`)
- Images et textures
- Icône : 🖼️

### **HDRI** (`.hdr`, `.exr`, `.ktx2`, `.png`, `.jpg`, `.jpeg`)
- Environnements et skyboxes
- Icône : 🌌

### **Audio** (`.mp3`, `.wav`, `.ogg`, `.m4a`)
- Fichiers audio et sons
- Icône : 🎵

## 💡 Avantages

### **Temps réel**
- Plus besoin d'attendre le déploiement GitHub Pages (2-3 minutes)
- Détection immédiate des nouveaux fichiers

### **Précision**
- Tailles de fichiers exactes depuis GitHub
- Pas de problèmes de cache navigateur

### **Simplicité**
- Un seul clic pour mettre à jour
- Interface intuitive avec feedback visuel

### **Fiabilité**
- Utilise l'API officielle GitHub
- Gestion d'erreurs robuste

## 🛠️ Technique

### **API utilisée**
```javascript
// Endpoint GitHub API
https://api.github.com/repos/albrice-montfort/fiv2-remote/contents/assets/{category}
```

### **Fonctionnalités JavaScript**
- `fetch()` pour les requêtes API
- Manipulation DOM dynamique
- Gestion asynchrone avec `async/await`
- Formatage automatique des tailles de fichiers

## 🎉 Résultat

Vos utilisateurs peuvent maintenant voir les nouveaux assets **immédiatement** après votre push, sans attendre le cycle de déploiement GitHub Pages !

---

*Cette fonctionnalité est particulièrement utile pour les projets Needle Engine où vous ajoutez fréquemment de nouveaux assets 3D.*
