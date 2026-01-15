# CLAUDE.md - Alba Education App V2 (STAGING)

**This is STAGING - uses TEST data, not Alba's real progress.**

---

## CRITICAL: Check Deployed URLs FIRST

**Repo source ≠ deployed output.** Always verify deployed state before checking repo.

```bash
# CORRECT: Check live sites first
curl -sL "https://spike1990ai.github.io/AEA-V2/" | head -20
curl -sL "https://spike1990ai.github.io/AEA-V2-staging/" | head -20

# Compare bundle sizes to verify sync
curl -sL "https://spike1990ai.github.io/AEA-V2/assets/index-*.js" | wc -c
curl -sL "https://spike1990ai.github.io/AEA-V2-staging/assets/index-*.js" | wc -c
```

**DO NOT check repo contents to verify sync status.**

---

## Environments

| | Production | Staging (THIS) |
|---|---|---|
| URL | spike1990ai.github.io/AEA-V2/ | spike1990ai.github.io/AEA-V2-staging/ |
| Gist | `3cdae715fe2eb3b76b17fa98212fec3e` | `c7d833305a1f527c65da66978ed82a06` |
| Data | Alba's real progress | TEST data |

**Same code, different data sources.**

---

## Repo Structure

```
AEA-V2-staging/
├── src/              # Source code (React)
├── dist/             # Built output (gitignored)
├── deploy.sh         # Build + deploy script
├── vite.config.js    # Build config
└── CLAUDE.md         # This file
```

**Branches:**
- `main` - Source code (develop here)
- `gh-pages` - Deployed output (never edit directly)

---

## Deploy

```bash
./deploy.sh
```

The script:
1. Builds to `/dist`
2. Copies to gh-pages branch
3. Pushes to GitHub
4. Returns to main

---

## The Three Commandments

### 1. NO LOCALSTORAGE
Gist is the ONLY source of truth.

### 2. SEPARATE ENVIRONMENTS
Production Gist ≠ Staging Gist. Never mix them.

### 3. IPHONE 6 COMPATIBILITY
Alba uses iPhone 6 (iOS 12, Safari 12). No modern CSS.

---

## PIN Codes
- Alba: `2468`
- Parent: `3521`
- Admin: `5756`

---

## Related

- **Production App:** https://spike1990ai.github.io/AEA-V2/
- **Parent Portal Staging:** https://spike1990ai.github.io/alba-parent-portal-staging/
- **Test Data Gist:** https://gist.github.com/c7d833305a1f527c65da66978ed82a06

---

## Incident Record: 2026-01-15

**Problem:** Claude checked repo source instead of deployed URLs, incorrectly concluded staging was broken.

**Fix:** Always check deployed URLs first.
