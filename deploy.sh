#!/bin/bash

# ==================================================
# Alba Education App STAGING - Deploy Script
# ==================================================
# Builds and deploys to gh-pages branch
# ==================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}========================================${NC}"
echo -e "${YELLOW}Deploying STAGING (AEA-V2-staging)${NC}"
echo -e "${YELLOW}========================================${NC}"

# Step 1: Ensure we're on main branch
echo -e "\n${GREEN}Step 1: Checking branch...${NC}"
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "Error: Must be on main branch"
    exit 1
fi

# Step 2: Build
echo -e "\n${GREEN}Step 2: Building...${NC}"
npm run build

if [ ! -d "dist" ]; then
    echo "Error: dist folder not created"
    exit 1
fi
echo "Build complete. dist/ size: $(du -sh dist | cut -f1)"

# Step 3: Deploy to gh-pages
echo -e "\n${GREEN}Step 3: Deploying to gh-pages...${NC}"

git stash --include-untracked
git fetch origin gh-pages
git checkout gh-pages

find . -maxdepth 1 ! -name '.git' ! -name '.' ! -name '..' ! -name 'CLAUDE.md' -exec rm -rf {} \;

git stash pop
cp -r dist/* .
rm -rf dist

git add -A
git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit"
git push origin gh-pages

git checkout main

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}Deployed STAGING successfully!${NC}"
echo -e "${GREEN}========================================${NC}"
echo -e "URL: https://spike1990ai.github.io/AEA-V2-staging/"
echo -e "Gist: c7d833305a1f527c65da66978ed82a06 (TEST DATA)"
