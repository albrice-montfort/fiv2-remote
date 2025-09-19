# 🔄 Mise à jour automatique des index.html

Ce document explique comment configurer la mise à jour automatique des pages d'index quand vous ajoutez de nouveaux fichiers.

## 🚀 Solutions disponibles

### 1. **Génération manuelle (Recommandé)**
```bash
# Après avoir ajouté de nouveaux fichiers
node generate-indexes.js
```

### 2. **Surveillance automatique**
```bash
# Lance la surveillance en arrière-plan
./watch-assets.sh
```

### 3. **Intégration GitHub Actions (Avancé)**
Créez `.github/workflows/update-indexes.yml` :
```yaml
name: Update Indexes
on:
  push:
    paths:
      - 'assets/**'
jobs:
  update:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: '16'
      - run: node generate-indexes.js
      - run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add assets/*/index.html
          git diff --staged --quiet || git commit -m "Auto-update indexes"
          git push
```

## 📁 Structure des fichiers

```
fiv2-remote/
├── generate-indexes.js    # Script de génération
├── watch-assets.sh        # Script de surveillance
├── assets/
│   ├── models/
│   │   ├── index.html     # Généré automatiquement
│   │   ├── heavy-models/
│   │   └── light-models/
│   ├── textures/
│   │   ├── index.html     # Généré automatiquement
│   │   ├── hd/
│   │   └── compressed/
│   ├── hdri/
│   │   ├── index.html     # Généré automatiquement
│   │   └── *.hdr, *.exr, etc.
│   └── audio/
│       ├── index.html     # Généré automatiquement
│       └── *.mp3, *.wav, etc.
```

## 🛠️ Utilisation

### **Étape 1 : Ajouter vos fichiers**
```bash
# Copiez vos fichiers dans les dossiers appropriés
cp mon-modele.glb assets/models/heavy-models/
cp ma-texture.png assets/textures/hd/
cp mon-environnement.hdr assets/hdri/
```

### **Étape 2 : Générer les index**
```bash
# Option A : Génération manuelle
node generate-indexes.js

# Option B : Surveillance automatique
./watch-assets.sh
```

### **Étape 3 : Pousser vers GitHub**
```bash
# Avec GitHub Desktop ou en ligne de commande
git add .
git commit -m "Add new assets and update indexes"
git push origin main
```

## 🔧 Configuration

### **Extensions supportées**
- **Modèles** : `.glb`, `.gltf`
- **Textures** : `.png`, `.jpg`, `.jpeg`, `.webp`, `.ktx2`
- **HDRI** : `.hdr`, `.exr`, `.ktx2`, `.png`, `.jpg`, `.jpeg`
- **Audio** : `.mp3`, `.wav`, `.ogg`, `.m4a`

### **Personnalisation**
Modifiez `generate-indexes.js` pour :
- Ajouter de nouvelles extensions
- Changer les icônes
- Modifier le style des pages
- Ajouter des métadonnées

## 📊 Fonctionnalités

### **Pages générées automatiquement**
- ✅ Liste des fichiers avec tailles
- ✅ Boutons de téléchargement
- ✅ URLs directes pour le code
- ✅ Design responsive
- ✅ Navigation entre dossiers

### **Détection automatique**
- ✅ Scan des extensions supportées
- ✅ Calcul des tailles de fichiers
- ✅ Mise à jour des URLs
- ✅ Gestion des erreurs

## 🚨 Dépannage

### **Problème : Les nouveaux fichiers n'apparaissent pas**
```bash
# Vérifiez que le script fonctionne
node generate-indexes.js

# Vérifiez les extensions supportées
# Ajoutez de nouvelles extensions dans generate-indexes.js
```

### **Problème : Erreur de permissions**
```bash
# Rendez les scripts exécutables
chmod +x generate-indexes.js
chmod +x watch-assets.sh
```

### **Problème : Node.js non trouvé**
```bash
# Installez Node.js
# macOS : brew install node
# Linux : apt install nodejs npm
# Windows : Téléchargez depuis nodejs.org
```

## 💡 Conseils

1. **Organisez vos fichiers** dans les bons dossiers
2. **Utilisez des noms descriptifs** pour vos fichiers
3. **Testez localement** avant de pousser vers GitHub
4. **Vérifiez les URLs** après déploiement
5. **Gardez les fichiers légers** pour un chargement rapide

## 🔗 URLs générées

Après génération, vos fichiers seront accessibles via :
```
https://albrice-montfort.github.io/fiv2-remote/assets/models/heavy-models/mon-modele.glb
https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/ma-texture.png
https://albrice-montfort.github.io/fiv2-remote/assets/hdri/mon-environnement.hdr
```

---

**Développé avec ❤️ pour Fractal Innov**
