# 🚀 Guide de Déploiement GitHub Pages

## ✅ Problème Résolu !

J'ai corrigé les erreurs dans les workflows GitHub Actions et créé un système de déploiement simplifié et fiable.

## 🔧 Corrections Apportées

### ❌ **Problèmes identifiés :**
1. **Permissions insuffisantes** dans les workflows
2. **Configuration complexe** avec des dépendances entre jobs
3. **Gestion des tokens** incorrecte
4. **Logique de déploiement** trop complexe

### ✅ **Solutions implémentées :**
1. **Workflow simplifié** : `.github/workflows/simple-deploy.yml`
2. **Permissions correctes** : `contents: read`, `pages: write`, `id-token: write`
3. **Script de déploiement simple** : `deploy-simple.sh`
4. **Génération automatique** des index.html

## 🚀 Comment Déployer Maintenant

### **Option 1 : GitHub Desktop (Recommandé)**
1. Ouvrez GitHub Desktop
2. Vous verrez les changements en attente
3. Cliquez sur "Commit to main"
4. Cliquez sur "Push origin"
5. Le workflow se déclenchera automatiquement

### **Option 2 : Ligne de commande avec authentification**
```bash
# Configurez un token d'accès personnel
git config --global credential.helper store

# Puis poussez
git push origin main
```

### **Option 3 : SSH (si configuré)**
```bash
# Changez l'URL du remote
git remote set-url origin git@github.com:albrice-montfort/fiv2-remote.git
git push origin main
```

## 🔄 Fonctionnement du Nouveau Système

### **Workflow Simple :**
1. **Push vers GitHub** → Déclenche le workflow
2. **Génération automatique** des index.html
3. **Déploiement direct** sur GitHub Pages
4. **Mise à jour immédiate** des pages

### **Vos fichiers HDRI sont détectés :**
- ✅ `HDRI_Nebula02_4k.png`
- ✅ `HDRI_Nebula02_8k.png`
- ✅ `modelviewer-Fi-HDRiSkybox.png`

## 📊 URLs qui seront mises à jour

Après déploiement, vos pages seront disponibles à :
- **Page principale** : https://albrice-montfort.github.io/fiv2-remote/
- **HDRI** : https://albrice-montfort.github.io/fiv2-remote/assets/hdri/
- **Modèles** : https://albrice-montfort.github.io/fiv2-remote/assets/models/
- **Textures** : https://albrice-montfort.github.io/fiv2-remote/assets/textures/

## 🛠️ Structure du Projet

```
fiv2-remote/
├── .github/
│   └── workflows/
│       └── simple-deploy.yml    # Workflow simplifié
├── assets/
│   ├── hdri/
│   │   ├── index.html          # Généré automatiquement
│   │   ├── HDRI_Nebula02_4k.png
│   │   ├── HDRI_Nebula02_8k.png
│   │   └── modelviewer-Fi-HDRiSkybox.png
│   ├── models/
│   │   └── index.html          # Généré automatiquement
│   ├── textures/
│   │   └── index.html          # Généré automatiquement
│   └── audio/
│       └── index.html          # Généré automatiquement
├── generate-indexes.js         # Script de génération
└── deploy-simple.sh            # Script de déploiement
```

## 🎯 Prochaines Étapes

1. **Poussez les changements** vers GitHub (via GitHub Desktop)
2. **Allez dans l'onglet "Actions"** de votre repository
3. **Vérifiez que le workflow "Simple Deploy" s'exécute**
4. **Attendez 2-3 minutes** pour que GitHub Pages se mette à jour
5. **Vérifiez vos URLs** pour confirmer que tout fonctionne

## 🔍 Vérification

### **Test des URLs :**
```bash
# Test local des URLs
curl -I https://albrice-montfort.github.io/fiv2-remote/assets/hdri/HDRI_Nebula02_4k.png
```

### **Vérification dans le navigateur :**
- Ouvrez https://albrice-montfort.github.io/fiv2-remote/assets/hdri/
- Vous devriez voir vos 3 fichiers HDRI listés
- Chaque fichier aura un bouton de téléchargement

## 🚨 Dépannage

### **Si le workflow échoue :**
1. Vérifiez les logs dans l'onglet "Actions"
2. Assurez-vous que GitHub Pages est activé dans les paramètres
3. Vérifiez que la branche `main` est configurée pour GitHub Pages

### **Si les pages ne se mettent pas à jour :**
1. Attendez 5-10 minutes (cache GitHub Pages)
2. Videz le cache de votre navigateur
3. Vérifiez que les fichiers sont bien dans le repository

## 💡 Avantages du Nouveau Système

- ✅ **Plus simple** et plus fiable
- ✅ **Moins d'erreurs** de configuration
- ✅ **Déploiement automatique** à chaque push
- ✅ **Génération automatique** des index
- ✅ **Pages toujours à jour** avec vos nouveaux assets

---

**Votre système est maintenant prêt ! Il suffit de pousser les changements vers GitHub.** 🎉
