#!/bin/bash

# QuietStor Website - Script de déploiement initial
# Usage: ./deploy.sh VOTRE_USERNAME_GITHUB

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if username is provided
if [ -z "$1" ]; then
    echo -e "${RED}❌ Erreur: Nom d'utilisateur GitHub requis${NC}"
    echo -e "${YELLOW}Usage: ./deploy.sh VOTRE_USERNAME_GITHUB${NC}"
    exit 1
fi

GITHUB_USERNAME=$1
REPO_NAME="quietstor-website"
REMOTE_URL="https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"

echo -e "${BLUE}🚀 Déploiement QuietStor Website${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}📦 Initialisation du repository Git...${NC}"
    git init
    echo -e "${GREEN}✅ Git initialisé${NC}"
else
    echo -e "${GREEN}✅ Git déjà initialisé${NC}"
fi

# Check if files exist
echo -e "${YELLOW}📁 Vérification des fichiers...${NC}"
required_files=("index.html" "privacy/index.html" "terms/index.html" "CNAME" "README.md")
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo -e "${RED}❌ Fichier manquant: $file${NC}"
        exit 1
    fi
done
echo -e "${GREEN}✅ Tous les fichiers sont présents${NC}"

# Add all files
echo -e "${YELLOW}📝 Ajout des fichiers au staging...${NC}"
git add -A
echo -e "${GREEN}✅ Fichiers ajoutés${NC}"

# Check if there are changes to commit
if git diff --cached --quiet; then
    echo -e "${YELLOW}⚠️  Aucun changement à commiter${NC}"
else
    # Commit
    echo -e "${YELLOW}💾 Création du commit...${NC}"
    git commit -m "feat: Initial website with legal pages

- Add landing page
- Add Privacy Policy (FR/EN)
- Add Terms of Service (FR/EN)
- Configure custom domain quietstor.app"
    echo -e "${GREEN}✅ Commit créé${NC}"
fi

# Check if main branch exists
current_branch=$(git branch --show-current)
if [ "$current_branch" != "main" ]; then
    echo -e "${YELLOW}🔄 Renommage de la branche en 'main'...${NC}"
    git branch -M main
    echo -e "${GREEN}✅ Branche renommée${NC}"
fi

# Check if remote exists
if git remote | grep -q "origin"; then
    echo -e "${YELLOW}⚠️  Remote 'origin' existe déjà${NC}"
    existing_url=$(git remote get-url origin)
    if [ "$existing_url" != "$REMOTE_URL" ]; then
        echo -e "${RED}❌ URL du remote différente !${NC}"
        echo -e "${YELLOW}   Existant: $existing_url${NC}"
        echo -e "${YELLOW}   Attendu:  $REMOTE_URL${NC}"
        echo -e "${YELLOW}Voulez-vous mettre à jour ? (y/n)${NC}"
        read -r response
        if [ "$response" = "y" ]; then
            git remote set-url origin "$REMOTE_URL"
            echo -e "${GREEN}✅ URL du remote mise à jour${NC}"
        else
            echo -e "${RED}❌ Déploiement annulé${NC}"
            exit 1
        fi
    fi
else
    echo -e "${YELLOW}🔗 Ajout du remote...${NC}"
    git remote add origin "$REMOTE_URL"
    echo -e "${GREEN}✅ Remote ajouté${NC}"
fi

# Push to GitHub
echo -e "${YELLOW}☁️  Push vers GitHub...${NC}"
echo -e "${BLUE}URL: $REMOTE_URL${NC}"

if git push -u origin main; then
    echo -e "${GREEN}✅ Code poussé vers GitHub !${NC}"
else
    echo -e "${RED}❌ Erreur lors du push${NC}"
    echo -e "${YELLOW}💡 Assurez-vous que :${NC}"
    echo -e "   1. Le repository ${REPO_NAME} existe sur GitHub"
    echo -e "   2. Vous avez les permissions d'écriture"
    echo -e "   3. Vous êtes authentifié (git config --global)"
    exit 1
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🎉 Déploiement réussi !${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BLUE}📍 Prochaines étapes :${NC}"
echo ""
echo -e "1. ${YELLOW}Activer GitHub Pages${NC}"
echo -e "   👉 https://github.com/${GITHUB_USERNAME}/${REPO_NAME}/settings/pages"
echo -e "      - Source: Branch 'main' / Folder '/ (root)'"
echo ""
echo -e "2. ${YELLOW}Configurer le domaine personnalisé${NC}"
echo -e "   👉 Ajouter les enregistrements DNS (voir DEPLOYMENT_GUIDE.md)"
echo ""
echo -e "3. ${YELLOW}Activer HTTPS${NC}"
echo -e "   👉 Cocher 'Enforce HTTPS' dans Settings > Pages"
echo ""
echo -e "${BLUE}📚 Documentation complète :${NC}"
echo -e "   - README.md"
echo -e "   - DEPLOYMENT_GUIDE.md"
echo -e "   - SUMMARY.md"
echo ""
echo -e "${GREEN}✨ Votre site sera bientôt accessible à :${NC}"
echo -e "   🌐 https://${GITHUB_USERNAME}.github.io/${REPO_NAME}/"
echo -e "   🌐 https://quietstor.app (après configuration DNS)"
echo ""

