# 🚀 Guide de déploiement QuietStor Website

Guide complet pour déployer le site web de QuietStor sur GitHub Pages avec domaine personnalisé.

## 📋 Pré-requis

- [ ] Compte GitHub
- [ ] Git installé localement
- [ ] Domaine `quietstor.app` acheté (ou autre domaine de votre choix)
- [ ] Accès au panneau DNS de votre registrar

## 🎯 Étapes de déploiement

### Étape 1 : Créer le repository GitHub

1. **Aller sur GitHub.com** et se connecter
2. **Créer un nouveau repository** : https://github.com/new
   - **Nom** : `quietstor-website`
   - **Visibilité** : **Public** ⚠️ (requis pour GitHub Pages gratuit)
   - **Ne PAS** cocher "Initialize with README"
   - Cliquer **"Create repository"**

### Étape 2 : Pousser le code

```bash
# 1. Naviguer vers le dossier du site
cd ~/Projects/PrivateFileManager/quietstor-website

# 2. Initialiser git
git init

# 3. Ajouter tous les fichiers
git add -A

# 4. Premier commit
git commit -m "feat: Initial website with legal pages

- Add landing page
- Add Privacy Policy (FR/EN)
- Add Terms of Service (FR/EN)
- Configure custom domain quietstor.app"

# 5. Ajouter le remote (REMPLACER 'VOTRE_USERNAME' par votre nom d'utilisateur GitHub)
git remote add origin https://github.com/VOTRE_USERNAME/quietstor-website.git

# 6. Renommer la branche en main
git branch -M main

# 7. Pousser vers GitHub
git push -u origin main
```

### Étape 3 : Activer GitHub Pages

1. **Aller dans votre repository** sur GitHub.com
2. Cliquer sur **Settings** (⚙️)
3. Dans le menu de gauche, cliquer sur **Pages**
4. Dans **Source**, sélectionner :
   - **Branch** : `main`
   - **Folder** : `/ (root)`
5. Cliquer **"Save"**

✅ Votre site est maintenant accessible à : `https://VOTRE_USERNAME.github.io/quietstor-website/`

### Étape 4 : Configurer le domaine personnalisé

#### A. Configuration DNS (chez votre registrar)

Vous devez acheter le domaine `quietstor.app` (ou un autre) et configurer les DNS.

**Enregistrements DNS à ajouter :**

| Type  | Host | Value                          | TTL  |
|-------|------|--------------------------------|------|
| A     | @    | 185.199.108.153                | 3600 |
| A     | @    | 185.199.109.153                | 3600 |
| A     | @    | 185.199.110.153                | 3600 |
| A     | @    | 185.199.111.153                | 3600 |
| CNAME | www  | VOTRE_USERNAME.github.io       | 3600 |

**Exemples de registrars :**
- **Namecheap** : Advanced DNS > Add New Record
- **Cloudflare** : DNS > Add record
- **Google Domains** : DNS > Custom records
- **OVH** : Zone DNS > Ajouter une entrée

⚠️ **IMPORTANT** : Remplacez `VOTRE_USERNAME` par votre nom d'utilisateur GitHub.

#### B. Configurer le domaine dans GitHub Pages

1. Retourner dans **Settings > Pages** sur GitHub
2. Dans **Custom domain**, entrer : `quietstor.app`
3. Cliquer **"Save"**

GitHub va vérifier la configuration DNS (peut prendre jusqu'à 24h).

#### C. Activer HTTPS

Une fois la vérification DNS terminée :

1. Cocher **"Enforce HTTPS"** dans Settings > Pages
2. Attendre quelques minutes pour que le certificat SSL soit généré

✅ Votre site est maintenant accessible en HTTPS à : `https://quietstor.app`

## 🧪 Tests de vérification

### Vérifier que les pages se chargent

```bash
# Page d'accueil
curl -I https://quietstor.app

# Privacy Policy
curl -I https://quietstor.app/privacy

# Terms of Service
curl -I https://quietstor.app/terms
```

Toutes les réponses doivent retourner `HTTP/2 200`.

### Vérifier HTTPS

```bash
curl -I https://quietstor.app | grep -i "strict-transport-security"
```

Doit retourner un header HSTS.

### Vérifier le domaine DNS

```bash
dig quietstor.app +short
```

Doit retourner les 4 IPs GitHub Pages (185.199.108-111.153).

## 📱 Configuration dans l'application

Une fois le site déployé, vérifier que les liens dans l'app pointent bien vers les bonnes URLs :

### SettingsScreen.tsx

```typescript
const PRIVACY_URL = 'https://quietstor.app/privacy';
const TERMS_URL = 'https://quietstor.app/terms';
```

✅ Ces URLs sont déjà configurées dans le code.

## 🔄 Workflow de mise à jour

### Modifier le contenu

```bash
# 1. Modifier les fichiers HTML localement
code privacy/index.html  # ou votre éditeur préféré

# 2. Mettre à jour la date de modification
# Chercher : <p><strong>Dernière mise à jour :</strong> [DATE]</p>
# Remplacer par la nouvelle date

# 3. Commit et push
git add -A
git commit -m "update: Description des changements"
git push

# 4. Les changements sont déployés automatiquement en ~1 minute
```

## ✅ Checklist de complétion

- [ ] Repository GitHub `quietstor-website` créé (public)
- [ ] Code poussé sur GitHub
- [ ] GitHub Pages activé sur la branche main
- [ ] Domaine `quietstor.app` acheté
- [ ] DNS configurés (4 enregistrements A + 1 CNAME)
- [ ] Domaine personnalisé configuré dans GitHub Pages
- [ ] HTTPS activé ("Enforce HTTPS" coché)
- [ ] Page d'accueil accessible : https://quietstor.app ✅
- [ ] Privacy Policy accessible : https://quietstor.app/privacy ✅
- [ ] Terms accessible : https://quietstor.app/terms ✅
- [ ] Certificat SSL valide (cadenas vert) 🔒
- [ ] Liens dans l'app mis à jour

## 🛠️ Dépannage

### Problème : "Domain's DNS record could not be retrieved"

**Cause :** Les DNS ne sont pas encore propagés.

**Solution :** Attendre 24h et vérifier avec `dig quietstor.app`.

### Problème : "HTTPS not available"

**Cause :** Certificat SSL en cours de génération.

**Solution :** Attendre 10-20 minutes après activation du domaine personnalisé.

### Problème : "404 Not Found" sur /privacy ou /terms

**Cause :** Structure de dossiers incorrecte.

**Solution :** Vérifier que les fichiers sont bien à :
- `privacy/index.html` ✅
- `terms/index.html` ✅

### Problème : Site inaccessible après push

**Cause :** Erreur de build GitHub Pages.

**Solution :** Aller dans Actions > Pages Build and Deployment > Voir les logs.

## 📊 Statistiques GitHub Pages

Une fois déployé, vous pouvez voir les stats :

- **Traffic** : Insights > Traffic (visiteurs, pages vues)
- **Deployments** : Environments > github-pages (historique)

## 🔒 Sécurité

### Headers de sécurité

GitHub Pages ajoute automatiquement :
- ✅ `Strict-Transport-Security` (HSTS)
- ✅ `X-Content-Type-Options: nosniff`
- ✅ `X-Frame-Options: SAMEORIGIN`

### Certificat SSL

- ✅ Let's Encrypt (gratuit, renouvelé automatiquement)
- ✅ TLS 1.2+ uniquement
- ✅ Grade A sur SSL Labs

## 📞 Support

**Questions ?** Contactez : quietstor.app@gmail.com

---

## 🎉 C'est terminé !

Votre site est maintenant live et conforme aux exigences Google Play :

- 🌐 **Site web public** : https://quietstor.app
- 🔒 **Privacy Policy** : https://quietstor.app/privacy
- 📄 **Terms of Service** : https://quietstor.app/terms
- 🔐 **HTTPS activé**
- 🌍 **Bilingue (FR/EN)**

**Vous pouvez maintenant soumettre QuietStor sur le Google Play Store !** 🚀

