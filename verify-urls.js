#!/usr/bin/env node

/**
 * Vérificateur d'URLs pour GitHub Pages
 * Vérifie que toutes les URLs générées sont correctes
 */

const fs = require('fs');
const path = require('path');

// Configuration
const baseUrl = 'https://albrice-montfort.github.io/fiv2-remote/';
const assetsDir = path.join(__dirname, 'assets');

// Fonction pour vérifier les URLs dans un fichier HTML
function verifyURLsInFile(filePath) {
    try {
        const content = fs.readFileSync(filePath, 'utf8');
        const urls = content.match(/href="[^"]*github\.io[^"]*"/g) || [];

        const results = {
            file: filePath,
            urls: [],
            errors: []
        };

        for (const urlMatch of urls) {
            const url = urlMatch.replace(/href="|"/g, '');
            results.urls.push(url);

            // Vérifier que l'URL contient '/assets/'
            if (!url.includes('/assets/')) {
                results.errors.push(`URL incorrecte (manque /assets/): ${url}`);
            }

            // Vérifier que l'URL ne commence pas par '/hdri/' ou '/textures/' etc.
            if (url.match(/\/[^\/]+\/[^\/]+\.(png|jpg|jpeg|glb|gltf|hdr|exr|mp3|wav|ogg|m4a)/)) {
                if (!url.includes('/assets/')) {
                    results.errors.push(`URL incorrecte (chemin direct): ${url}`);
                }
            }
        }

        return results;
    } catch (error) {
        return {
            file: filePath,
            urls: [],
            errors: [`Erreur de lecture: ${error.message}`]
        };
    }
}

// Fonction pour scanner tous les fichiers HTML
function scanAllHTMLFiles() {
    const results = [];

    try {
        const categories = fs.readdirSync(assetsDir);

        for (const category of categories) {
            const categoryPath = path.join(assetsDir, category);

            if (fs.statSync(categoryPath).isDirectory()) {
                const indexPath = path.join(categoryPath, 'index.html');

                if (fs.existsSync(indexPath)) {
                    const result = verifyURLsInFile(indexPath);
                    results.push(result);
                }
            }
        }
    } catch (error) {
        console.error('Erreur lors du scan:', error.message);
    }

    return results;
}

// Fonction principale
function main() {
    console.log('🔍 Vérification des URLs dans tous les dossiers assets...');
    console.log('=====================================================');

    const results = scanAllHTMLFiles();
    let totalErrors = 0;
    let totalURLs = 0;

    for (const result of results) {
        const relativePath = path.relative(__dirname, result.file);
        console.log(`\n📁 ${relativePath}`);

        if (result.urls.length === 0) {
            console.log('   ℹ️  Aucune URL GitHub détectée');
        } else {
            console.log(`   📊 ${result.urls.length} URL(s) détectée(s)`);

            for (const url of result.urls) {
                console.log(`   🔗 ${url}`);
            }
        }

        if (result.errors.length > 0) {
            console.log('   ❌ Erreurs détectées:');
            for (const error of result.errors) {
                console.log(`      - ${error}`);
            }
            totalErrors += result.errors.length;
        } else {
            console.log('   ✅ Aucune erreur détectée');
        }

        totalURLs += result.urls.length;
    }

    console.log('\n📊 Résumé:');
    console.log('===========');
    console.log(`Total d'URLs: ${totalURLs}`);
    console.log(`Total d'erreurs: ${totalErrors}`);

    if (totalErrors === 0) {
        console.log('🎉 Toutes les URLs sont correctes !');
    } else {
        console.log('⚠️  Des erreurs ont été détectées. Vérifiez les URLs ci-dessus.');
    }

    return totalErrors === 0;
}

// Exécuter le script
if (require.main === module) {
    const success = main();
    process.exit(success ? 0 : 1);
}

module.exports = { verifyURLsInFile, scanAllHTMLFiles };
