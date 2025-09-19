#!/usr/bin/env node

/**
 * Générateur automatique d'index.html pour GitHub Pages
 * Scanne les dossiers et génère des pages dynamiques
 */

const fs = require('fs');
const path = require('path');

// Configuration
const baseUrl = 'https://albrice-montfort.github.io/fiv2-remote/';
const supportedExtensions = {
    models: ['.glb', '.gltf'],
    textures: ['.png', '.jpg', '.jpeg', '.webp', '.ktx2'],
    hdri: ['.hdr', '.exr', '.ktx2', '.png', '.jpg', '.jpeg'],
    audio: ['.mp3', '.wav', '.ogg', '.m4a']
};

// Fonction pour obtenir la taille d'un fichier
function getFileSize(filePath) {
    try {
        const stats = fs.statSync(filePath);
        return formatFileSize(stats.size);
    } catch (error) {
        return 'Taille inconnue';
    }
}

// Fonction pour formater la taille
function formatFileSize(bytes) {
    if (bytes === 0) return '0 B';
    const k = 1024;
    const sizes = ['B', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
}

// Fonction pour scanner un dossier
function scanDirectory(dirPath, extensions) {
    const files = [];

    try {
        const items = fs.readdirSync(dirPath);

        for (const item of items) {
            const fullPath = path.join(dirPath, item);
            const stat = fs.statSync(fullPath);

            if (stat.isFile()) {
                const ext = path.extname(item).toLowerCase();
                if (extensions.includes(ext)) {
                    files.push({
                        name: item,
                        size: getFileSize(fullPath),
                        extension: ext,
                        path: fullPath
                    });
                }
            }
        }
    } catch (error) {
        console.log(`Erreur lors du scan de ${dirPath}:`, error.message);
    }

    return files;
}

// Fonction pour générer le HTML d'un item
function generateItemHTML(item, category, basePath) {
    const relativePath = path.relative(basePath, item.path).replace(/\\/g, '/');
    const url = baseUrl + relativePath;

    const icons = {
        models: '🎨',
        textures: '🖼️',
        hdri: '🌌',
        audio: '🎵'
    };

    const icon = icons[category] || '📄';

    return `
        <div class="asset-item">
            <div class="asset-preview">${icon}</div>
            <div class="asset-info">
                <div class="asset-name">${item.name}</div>
                <div class="asset-details">${item.extension.toUpperCase()} - ${item.size}</div>
            </div>
            <a href="${url}" class="download-btn" download>📥 Télécharger</a>
        </div>
    `;
}

// Fonction pour générer une page d'index
function generateIndexPage(category, files, basePath) {
    const titles = {
        models: 'Modèles 3D',
        textures: 'Textures',
        hdri: 'Environnements HDRI',
        audio: 'Fichiers Audio'
    };

    const descriptions = {
        models: 'Modèles 3D optimisés pour le web',
        textures: 'Textures et images haute qualité',
        hdri: 'Environnements HDRI et skyboxes',
        audio: 'Fichiers audio et sons'
    };

    const icons = {
        models: '🎨',
        textures: '🖼️',
        hdri: '🌌',
        audio: '🎵'
    };

    const title = titles[category];
    const description = descriptions[category];
    const icon = icons[category];

    let content = '';

    if (files.length === 0) {
        content = `
            <div class="empty-state">
                <h3>📁 Aucun fichier trouvé</h3>
                <p>Ajoutez des fichiers dans ce dossier et relancez le script</p>
                <p>Ils apparaîtront automatiquement ici !</p>
            </div>
        `;
    } else {
        content = `
            <div class="assets-grid">
                ${files.map(file => generateItemHTML(file, category, basePath)).join('')}
            </div>
        `;
    }

    return `<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} - Fractal Innov</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #181A33 0%, #0BA398 100%);
            color: white;
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
            background: linear-gradient(45deg, #66A22F, #0BA398);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .assets-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .asset-item {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            padding: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: center;
            transition: all 0.3s ease;
        }
        .asset-item:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
        }
        .asset-preview {
            width: 100%;
            height: 150px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3em;
            color: #66A22F;
        }
        .asset-name {
            font-weight: bold;
            margin-bottom: 10px;
            color: #66A22F;
        }
        .asset-details {
            font-size: 0.9em;
            opacity: 0.8;
            margin-bottom: 15px;
        }
        .download-btn {
            background: linear-gradient(45deg, #66A22F, #0BA398);
            color: white;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 0.9em;
            display: inline-block;
            transition: transform 0.3s ease;
        }
        .download-btn:hover {
            transform: scale(1.05);
        }
        .back-link {
            position: absolute;
            top: 20px;
            left: 20px;
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            backdrop-filter: blur(10px);
        }
        .back-link:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        .empty-state {
            text-align: center;
            padding: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .empty-state h3 {
            color: #66A22F;
            margin-bottom: 10px;
        }
        .info-box {
            background: rgba(11, 163, 152, 0.2);
            border: 1px solid #0BA398;
            border-radius: 10px;
            padding: 20px;
            margin-top: 30px;
        }
        .info-box h3 {
            color: #0BA398;
            margin-top: 0;
        }
    </style>
</head>
<body>
    <a href="../../index.html" class="back-link">← Retour à l'accueil</a>

    <div class="container">
        <div class="header">
            <h1>${icon} ${title}</h1>
            <p>${description}</p>
        </div>

        ${content}

        <div class="info-box">
            <h3>🔗 Base URL pour les ${title.toLowerCase()}</h3>
            <div style="background: rgba(0, 0, 0, 0.3); padding: 15px; border-radius: 5px; font-family: monospace; margin: 10px 0;">
                ${baseUrl}assets/${category}/
            </div>
        </div>
    </div>
</body>
</html>`;
}

// Fonction principale
function main() {
    console.log('🚀 Génération automatique des index.html...');

    const assetsDir = path.join(__dirname, 'assets');

    // Scanner chaque catégorie
    for (const [category, extensions] of Object.entries(supportedExtensions)) {
        const categoryDir = path.join(assetsDir, category);

        if (fs.existsSync(categoryDir)) {
            console.log(`📁 Scan de ${category}...`);
            const files = scanDirectory(categoryDir, extensions);
            console.log(`   Trouvé ${files.length} fichiers`);

            // Générer l'index.html
            const indexPath = path.join(categoryDir, 'index.html');
            const html = generateIndexPage(category, files, assetsDir);

            fs.writeFileSync(indexPath, html);
            console.log(`   ✅ ${indexPath} généré`);
        } else {
            console.log(`   ⚠️  Dossier ${category} non trouvé`);
        }
    }

    console.log('✅ Génération terminée !');
    console.log('💡 Relancez ce script après avoir ajouté de nouveaux fichiers');
}

// Exécuter le script
if (require.main === module) {
    main();
}

module.exports = { generateIndexPage, scanDirectory, getFileSize };
