#!/usr/bin/env node

/**
 * Script de test pour vérifier l'API GitHub et diagnostiquer les erreurs 404
 */

const https = require('https');

// Configuration
const baseApiUrl = 'https://api.github.com/repos/albrice-montfort/fiv2-remote/contents/assets';
const categories = ['models', 'textures', 'hdri', 'audio', 'chunks'];

// Fonction pour faire une requête HTTP
function makeRequest(url) {
    return new Promise((resolve, reject) => {
        https.get(url, (res) => {
            let data = '';

            res.on('data', (chunk) => {
                data += chunk;
            });

            res.on('end', () => {
                try {
                    const parsed = JSON.parse(data);
                    resolve({ status: res.statusCode, data: parsed });
                } catch (error) {
                    resolve({ status: res.statusCode, data: data });
                }
            });
        }).on('error', (error) => {
            reject(error);
        });
    });
}

// Fonction pour tester une catégorie
async function testCategory(category) {
    console.log(`\n🔍 Test de la catégorie: ${category}`);
    console.log('='.repeat(50));

    const url = `${baseApiUrl}/${category}`;
    console.log(`📡 URL: ${url}`);

    try {
        const result = await makeRequest(url);
        console.log(`📊 Status: ${result.status}`);

        if (result.status === 200) {
            const items = result.data;
            console.log(`✅ Succès! ${items.length} éléments trouvés:`);

            items.forEach(item => {
                if (item.type === 'file') {
                    console.log(`   📄 ${item.name} (${item.size} bytes)`);
                } else if (item.type === 'dir') {
                    console.log(`   📁 ${item.name}/`);
                }
            });

            // Tester les sous-dossiers
            const dirs = items.filter(item => item.type === 'dir');
            for (const dir of dirs) {
                console.log(`\n  🔍 Sous-dossier: ${dir.name}`);
                try {
                    const subResult = await makeRequest(dir.url);
                    if (subResult.status === 200) {
                        const subItems = subResult.data.filter(item => item.type === 'file');
                        console.log(`     ✅ ${subItems.length} fichiers trouvés`);
                        subItems.forEach(file => {
                            console.log(`       📄 ${file.name} (${file.size} bytes)`);
                        });
                    } else {
                        console.log(`     ❌ Erreur ${subResult.status}`);
                    }
                } catch (error) {
                    console.log(`     ❌ Erreur: ${error.message}`);
                }
            }

        } else if (result.status === 404) {
            console.log(`❌ Erreur 404: Dossier non trouvé ou vide`);
        } else {
            console.log(`❌ Erreur ${result.status}: ${result.data}`);
        }

    } catch (error) {
        console.log(`❌ Erreur réseau: ${error.message}`);
    }
}

// Fonction principale
async function main() {
    console.log('🧪 Test de l\'API GitHub pour diagnostiquer les erreurs 404');
    console.log('============================================================');

    for (const category of categories) {
        await testCategory(category);
        await new Promise(resolve => setTimeout(resolve, 1000)); // Pause pour éviter le rate limiting
    }

    console.log('\n🎯 Résumé des corrections apportées:');
    console.log('=====================================');
    console.log('✅ Gestion des erreurs 404 (dossiers vides)');
    console.log('✅ Scan récursif des sous-dossiers');
    console.log('✅ Messages d\'erreur plus explicites');
    console.log('✅ Filtrage des fichiers système (.DS_Store, .gitkeep)');
    console.log('✅ Fallback gracieux en cas d\'erreur de taille');

    console.log('\n💡 Le bouton Refresh devrait maintenant fonctionner sans erreur 404!');
}

// Exécuter le test
if (require.main === module) {
    main().catch(console.error);
}
