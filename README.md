# 🚀 Fractal Innov - Assets Repository

Repository d'assets pour le chargement à distance des applications Fractal Innov.

## 📁 Structure

```
fiv2-remote/
├── index.html              # Page d'accueil GitHub Pages
├── README.md              # Documentation
└── assets/
    ├── models/            # Modèles 3D
    │   ├── heavy-models/  # Modèles très lourds (>5MB)
    │   │   └── Fiv2_06M.glb
    │   └── light-models/  # Modèles légers (<1MB)
    ├── textures/          # Textures et images
    │   ├── hd/           # Textures haute résolution
    │   │   ├── FIv2_UI01_2k.PNG
    │   │   ├── FIv2_UI01A_2k.png
    │   │   ├── FIv2_UI02_2k.png
    │   │   ├── FIv2_UI03_2k.png
    │   │   ├── FIv2_UI04_2k.png
    │   │   ├── FIv2_UI05_2k.PNG
    │   │   ├── FIv2_UI06_2k.png
    │   │   └── FIv2_UI07_2k.PNG
    │   └── compressed/   # Textures compressées
    ├── hdri/             # Environnements HDRI
    └── audio/            # Fichiers audio
```

## 🔗 Accès aux Assets

### Base URL
```
https://albrice-montfort.github.io/fiv2-remote/
```

### Exemples d'URLs disponibles
- **Modèle 3D** : `https://albrice-montfort.github.io/fiv2-remote/assets/models/heavy-models/Fiv2_06M.glb`
- **Textures HD** : `https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI01_2k.PNG`
- **Autres textures** : `https://albrice-montfort.github.io/fiv2-remote/assets/textures/hd/FIv2_UI02_2k.png`

## 🛠️ Utilisation avec Needle Engine

### Dans Unity avec NestedGltf
```csharp
// Ajouter le composant NestedGltf sur un GameObject
// Configurer filePath avec l'URL complète :
filePath = "https://albrice-montfort.github.io/fiv2-remote/assets/models/heavy-models/Fiv2_06M.glb"
```

### Dans TypeScript
```typescript
// Chargement d'asset à distance
const assetUrl = "https://albrice-montfort.github.io/fiv2-remote/assets/models/heavy-models/Fiv2_06M.glb";
const loader = new GLTFLoader();
const gltf = await loader.loadAsync(assetUrl);
```

### Configuration GLBLoaderTrigger
```typescript
// Dans votre GLBLoaderTrigger.ts
public githubBaseUrl: string = "https://albrice-montfort.github.io/fiv2-remote/";
public remoteAssetUrls: string[] = [
    "assets/models/heavy-models/Fiv2_06M.glb",
    "assets/textures/hd/FIv2_UI01_2k.PNG"
];
```

## 📦 Ajout d'Assets

### 1. Préparer les fichiers
```bash
# Organiser les assets dans la structure appropriée
cp your-model.glb assets/models/heavy-models/
cp your-texture.png assets/textures/hd/
```

### 2. Commit et Push
```bash
git add .
git commit -m "Add new assets: [description]"
git push origin main
```

### 3. Vérifier l'accès
```bash
# Tester l'URL
curl -I https://albrice-montfort.github.io/fiv2-remote/assets/models/heavy-models/Fiv2_06M.glb
```

## ⚡ Optimisations

### Compression des Assets
- **GLB** : Utiliser la compression Draco/Meshopt
- **Images** : Optimiser avec TinyPNG ou ImageOptim
- **Audio** : Compresser en MP3/OGG

### Chargement Différé
- Charger les assets lourds après la première frame
- Utiliser des LODs pour les modèles 3D
- Implémenter un système de cache

## 🔧 Configuration GitHub Pages

✅ **Déjà configuré** :
- Source : Deploy from a branch
- Branch : main
- Folder : / (root)

## 📊 Assets Actuellement Disponibles

### Modèles 3D
- `Fiv2_06M.glb` - Modèle 3D principal (6MB)

### Textures HD
- `FIv2_UI01_2k.PNG` - Interface utilisateur 1
- `FIv2_UI01A_2k.png` - Interface utilisateur 1A
- `FIv2_UI02_2k.png` - Interface utilisateur 2
- `FIv2_UI03_2k.png` - Interface utilisateur 3
- `FIv2_UI04_2k.png` - Interface utilisateur 4
- `FIv2_UI05_2k.PNG` - Interface utilisateur 5
- `FIv2_UI06_2k.png` - Interface utilisateur 6
- `FIv2_UI07_2k.PNG` - Interface utilisateur 7

## 🚨 Sécurité

- Ne pas exposer d'informations sensibles
- Utiliser des noms de fichiers non-prévisibles si nécessaire
- Considérer l'authentification pour les assets privés

## 📞 Support

Pour toute question concernant ce repository d'assets :
- Créer une issue sur ce repository
- Contacter l'équipe Fractal Innov

---

**Développé avec ❤️ par l'équipe Fractal Innov**
