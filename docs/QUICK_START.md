# ⚡ Quick Start - Déploiement en 5 minutes

Guide ultra-rapide pour déployer le site QuietStor sur GitHub Pages.

## 🚀 Méthode automatique (recommandée)

### Étape 1 : Créer le repository sur GitHub

1. Aller sur https://github.com/new
2. Nom : `quietstor-website`
3. Visibilité : **Public**
4. Cliquer **"Create repository"**

### Étape 2 : Exécuter le script de déploiement

```bash
cd ~/Projects/PrivateFileManager/quietstor-website
./deploy.sh VOTRE_USERNAME_GITHUB
```

Remplacez `VOTRE_USERNAME_GITHUB` par votre nom d'utilisateur GitHub.

**Le script fait automatiquement** :
- ✅ Initialise git
- ✅ Ajoute tous les fichiers
- ✅ Crée le commit initial
- ✅ Configure le remote
- ✅ Push vers GitHub

### Étape 3 : Activer GitHub Pages

1. Aller sur https://github.com/VOTRE_USERNAME/quietstor-website/settings/pages
2. **Source** : `Branch: main` / `Folder: / (root)`
3. Cliquer **"Save"**

✅ **Votre site est live** à : `https://VOTRE_USERNAME.github.io/quietstor-website/`

---

## 🌐 Configuration domaine personnalisé (optionnel)

### Étape 4 : Acheter le domaine

Acheter `quietstor.app` chez un registrar (Namecheap, Cloudflare, Google Domains, OVH...).

### Étape 5 : Configurer les DNS

Ajouter ces enregistrements DNS :

```
A     @    185.199.108.153
A     @    185.199.109.153
A     @    185.199.110.153
A     @    185.199.111.153
CNAME www  VOTRE_USERNAME.github.io
```

### Étape 6 : Activer le domaine dans GitHub Pages

1. GitHub > Settings > Pages
2. **Custom domain** : `quietstor.app`
3. **Save**
4. Attendre 24h max pour propagation DNS
5. Cocher **"Enforce HTTPS"**

✅ **Votre site est accessible à** : `https://quietstor.app`

---

## 🔧 Méthode manuelle (si le script ne fonctionne pas)

```bash
cd ~/Projects/PrivateFileManager/quietstor-website

# 1. Init git
git init

# 2. Ajouter fichiers
git add -A

# 3. Commit
git commit -m "feat: Initial website with legal pages"

# 4. Ajouter remote (REMPLACER VOTRE_USERNAME)
git remote add origin https://github.com/VOTRE_USERNAME/quietstor-website.git

# 5. Renommer branche
git branch -M main

# 6. Push
git push -u origin main
```

Puis suivre étape 3 (GitHub Pages).

---

## ✅ Vérification rapide

Une fois déployé, tester :

```bash
# Test page d'accueil
curl -I https://quietstor.app

# Test privacy
curl -I https://quietstor.app/privacy

# Test terms
curl -I https://quietstor.app/terms
```

Tous doivent retourner `HTTP/2 200`.

---

## 🎯 URLs pour Google Play Console

Copier ces URLs dans Play Console :

- **Privacy Policy** : `https://quietstor.app/privacy`
- **Terms of Service** : `https://quietstor.app/terms`

---

## ❓ Besoin d'aide ?

- 📖 **Guide complet** : `DEPLOYMENT_GUIDE.md`
- 📋 **Récapitulatif** : `SUMMARY.md`
- 📧 **Support** : quietstor.app@gmail.com

---

## 🎉 C'est tout !

Votre site est maintenant conforme aux exigences Google Play. Vous pouvez soumettre QuietStor sur le Play Store ! 🚀

