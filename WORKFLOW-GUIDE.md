# 🔄 Guide du Workflow Automatique GitHub Pages

Ce guide explique comment utiliser le système de déploiement automatique pour GitHub Pages avec mise à jour des index.

## 🚀 Déploiement Automatique

### Méthode 1 : Script de déploiement (Recommandé)
```bash
# Déploiement avec workflow automatique
./deploy-auto-workflow.sh
```

### Méthode 2 : Déploiement manuel
```bash
# 1. Générer les index
node generate-indexes.js

# 2. Ajouter et commiter
git add .
git commit -m "Add new assets"
git push origin main

# 3. Le workflow GitHub Actions se déclenche automatiquement
```

## 🔧 Workflows GitHub Actions

### 1. **deploy.yml** - Déploiement principal
- Se déclenche sur chaque push vers `main`
- Génère automatiquement les index.html
- Déploie sur GitHub Pages
- Met à jour les pages si des changements sont détectés

### 2. **update-assets.yml** - Mise à jour des assets
- Se déclenche uniquement quand des fichiers dans `assets/` changent
- Génère et met à jour les index.html
- Plus rapide et ciblé

## 📁 Structure des Fichiers

```
fiv2-remote/
├── .github/
│   └── workflows/
│       ├── deploy.yml           # Workflow principal
│       └── update-assets.yml    # Workflow assets
├── assets/
│   ├── hdri/
│   │   ├── index.html          # Généré automatiquement
│   │   └── *.png, *.hdr, etc.
│   ├── models/
│   │   ├── index.html          # Généré automatiquement
│   │   └── *.glb, *.gltf
│   ├── textures/
│   │   ├── index.html          # Généré automatiquement
│   │   └── *.png, *.jpg, etc.
│   └── audio/
│       ├── index.html          # Généré automatiquement
│       └── *.mp3, *.wav, etc.
├── generate-indexes.js         # Script de génération
└── deploy-auto-workflow.sh     # Script de déploiement
```

## 🎯 Utilisation

### **Étape 1 : Ajouter vos fichiers**
```bash
# Copiez vos fichiers dans les dossiers appropriés
cp mon-hdri.hdr assets/hdri/
cp mon-modele.glb assets/models/heavy-models/
cp ma-texture.png assets/textures/hd/
```

### **Étape 2 : Déployer**
```bash
# Option A : Script automatique (recommandé)
./deploy-auto-workflow.sh

# Option B : Manuel
git add .
git commit -m "Add new assets"
git push origin main
```

### **Étape 3 : Vérifier**
- Allez dans l'onglet "Actions" de votre repository GitHub
- Vérifiez que le workflow s'exécute correctement
- Attendez 2-3 minutes pour que GitHub Pages se mette à jour

## 🔍 Vérification du Déploiement

### **URLs de test**
- **Page principale** : https://albrice-montfort.github.io/fiv2-remote/
- **HDRI** : https://albrice-montfort.github.io/fiv2-remote/assets/hdri/
- **Modèles** : https://albrice-montfort.github.io/fiv2-remote/assets/models/
- **Textures** : https://albrice-montfort.github.io/fiv2-remote/assets/textures/

### **Vérification des assets**
```bash
# Test local des URLs
curl -I https://albrice-montfort.github.io/fiv2-remote/assets/hdri/HDRI_Nebula02_4k.png
```

## 🛠️ Configuration

### **Extensions supportées**
- **Modèles** : `.glb`, `.gltf`
- **Textures** : `.png`, `.jpg`, `.jpeg`, `.webp`, `.ktx2`
- **HDRI** : `.hdr`, `.exr`, `.ktx2`, `.png`, `.jpg`, `.jpeg`
- **Audio** : `.mp3`, `.wav`, `.ogg`, `.m4a`

### **Personnalisation**
Modifiez `generate-indexes.js` pour :
- Ajouter de nouvelles extensions
- Changer les icônes et styles
- Modifier les URLs de base
- Ajouter des métadonnées

## 🚨 Dépannage

### **Problème : Les nouveaux fichiers n'apparaissent pas**
1. Vérifiez que le fichier est dans le bon dossier
2. Vérifiez que l'extension est supportée
3. Relancez `node generate-indexes.js` localement
4. Vérifiez les logs du workflow GitHub Actions

### **Problème : Workflow ne se déclenche pas**
1. Vérifiez que les fichiers sont dans `.github/workflows/`
2. Vérifiez la syntaxe YAML
3. Vérifiez les permissions du repository
4. Activez GitHub Pages dans les paramètres du repository

### **Problème : Erreur de permissions**
```bash
# Rendez les scripts exécutables
chmod +x deploy-auto-workflow.sh
chmod +x watch-assets.sh
```

## 📊 Fonctionnalités

### **Pages générées automatiquement**
- ✅ Liste des fichiers avec tailles
- ✅ Boutons de téléchargement
- ✅ URLs directes pour le code
- ✅ Design responsive et moderne
- ✅ Navigation entre dossiers

### **Détection automatique**
- ✅ Scan des extensions supportées
- ✅ Calcul des tailles de fichiers
- ✅ Mise à jour des URLs
- ✅ Gestion des erreurs
- ✅ Commit automatique des changements

### **Workflow GitHub Actions**
- ✅ Déploiement automatique
- ✅ Génération des index
- ✅ Mise à jour des pages
- ✅ Notifications de statut

## 💡 Conseils

1. **Organisez vos fichiers** dans les bons dossiers
2. **Utilisez des noms descriptifs** pour vos fichiers
3. **Testez localement** avant de pousser vers GitHub
4. **Vérifiez les URLs** après déploiement
5. **Gardez les fichiers légers** pour un chargement rapide
6. **Surveillez les logs** du workflow GitHub Actions

## 🔗 URLs Générées

Après déploiement, vos fichiers seront accessibles via :
```
https://albrice-montfort.github.io/fiv2-remote/assets/hdri/mon-hdri.hdr
https://albrice-montfort.github.io/fiv2-remote/assets/models/mon-modele.glb
https://albrice-montfort.github.io/fiv2-remote/assets/textures/ma-texture.png
```

---

**Développé avec ❤️ pour Fractal Innov**

*Ce système garantit que vos assets sont toujours à jour sur GitHub Pages !*
