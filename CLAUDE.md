# CLAUDE.md - Alba Education App V2 (STAGING)

## Purpose
Staging environment for Alba's Education App. Uses TEST data Gist, not production data.

---

## CRITICAL: Check Deployed URLs First

**DO NOT check repo source to verify sync status.**

Repo contains React source code. Deployed site has built bundles. They look different but ARE synced.

```bash
# CORRECT: Check live sites
curl -sL "https://spike1990ai.github.io/AEA-V2/" | head -20
curl -sL "https://spike1990ai.github.io/AEA-V2-staging/" | head -20

# WRONG: Checking repo files
gh api repos/Spike1990AI/AEA-V2-staging/contents  # DO NOT USE FOR SYNC CHECK
```

---

## Environments

| Environment | URL | Gist ID |
|-------------|-----|---------|
| **Production** | https://spike1990ai.github.io/AEA-V2/ | `3cdae715fe2eb3b76b17fa98212fec3e` |
| **Staging** | https://spike1990ai.github.io/AEA-V2-staging/ | `c7d833305a1f527c65da66978ed82a06` |

**Same code, different data sources.**

---

## This is STAGING

- Uses TEST Gist: `c7d833305a1f527c65da66978ed82a06`
- Safe to experiment
- Does NOT affect Alba's real progress data

---

## Build & Deploy

```bash
# Install dependencies
npm install

# Build (output to /dist)
npm run build

# Deploy
./deploy.sh  # Builds and pushes to gh-pages
```

---

## PIN Codes
- Alba: `2468`
- Parent: `3521`

---

## Related

- **Production App:** https://spike1990ai.github.io/AEA-V2/
- **Parent Portal Staging:** https://spike1990ai.github.io/alba-parent-portal-staging/
- **Test Data Gist:** https://gist.github.com/c7d833305a1f527c65da66978ed82a06
