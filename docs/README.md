# QuietStor Website

Site web officiel de QuietStor hébergé sur GitHub Pages.

## 📁 Structure

```
quietstor-website/
├── index.html          # Page d'accueil
├── privacy/
│   └── index.html      # Politique de confidentialité (FR/EN)
├── terms/
│   └── index.html      # Conditions d'utilisation (FR/EN)
├── CNAME               # Configuration domaine personnalisé
└── README.md           # Ce fichier
```

## 🚀 Déploiement sur GitHub Pages

### 1. Créer le repository GitHub

```bash
# Depuis GitHub.com
1. Aller sur https://github.com/new
2. Nom du repository: quietstor-website
3. Visibilité: Public (requis pour GitHub Pages gratuit)
4. Ne pas initialiser avec README, .gitignore, ou license
5. Cliquer "Create repository"
```

### 2. Pousser le code

```bash
cd quietstor-website

# Initialiser git
git init
git add -A
git commit -m "feat: Initial website with legal pages

- Add landing page
- Add Privacy Policy (FR/EN)
- Add Terms of Service (FR/EN)
- Configure custom domain quietstor.app"

# Ajouter le remote
git remote add origin https://github.com/VOTRE_USERNAME/quietstor-website.git

# Pousser
git branch -M main
git push -u origin main
```

### 3. Activer GitHub Pages

```bash
# Sur GitHub.com
1. Aller dans Settings > Pages
2. Source: Deploy from a branch
3. Branch: main / (root)
4. Cliquer "Save"
```

Le site sera disponible à : `https://VOTRE_USERNAME.github.io/quietstor-website/`

### 4. Configurer le domaine personnalisé (quietstor.app)

#### A. Configuration DNS chez votre registrar

Ajouter ces enregistrements DNS :

```
Type    Host    Value                     TTL
A       @       185.199.108.153           3600
A       @       185.199.109.153           3600
A       @       185.199.110.153           3600
A       @       185.199.111.153           3600
CNAME   www     VOTRE_USERNAME.github.io  3600
```

**Note :** Remplacez `VOTRE_USERNAME` par votre nom d'utilisateur GitHub.

#### B. Vérifier le fichier CNAME

Le fichier `CNAME` doit contenir :
```
quietstor.app
```

#### C. Activer HTTPS

Sur GitHub.com > Settings > Pages :
1. Attendre que la vérification DNS soit complète (peut prendre 24h)
2. Cocher "Enforce HTTPS"

### 5. URLs finales

Une fois configuré :
- 🏠 Page d'accueil : `https://quietstor.app`
- 🔒 Privacy Policy : `https://quietstor.app/privacy`
- 📄 Terms of Service : `https://quietstor.app/terms`

## ✅ Vérification

Tester que tout fonctionne :

```bash
# Vérifier que les pages se chargent
curl -I https://quietstor.app
curl -I https://quietstor.app/privacy
curl -I https://quietstor.app/terms

# Vérifier HTTPS
curl -I https://quietstor.app | grep -i "strict-transport-security"
```

## 🔄 Mises à jour

Pour mettre à jour le site :

```bash
# Modifier les fichiers localement
# Puis commit et push

git add -A
git commit -m "update: Description des changements"
git push

# Les changements seront déployés automatiquement en ~1 minute
```

## 📋 Conformité Google Play

Ce site répond aux exigences Google Play :

- ✅ Privacy Policy publique et accessible
- ✅ Terms of Service publics et accessibles
- ✅ HTTPS activé (sécurité)
- ✅ Domaine personnalisé (professionnel)
- ✅ Contenu bilingue (FR/EN)

## 🛠️ Maintenance

### Mettre à jour la date

Quand vous modifiez les pages légales, mettez à jour :

```html
<!-- Dans privacy/index.html et terms/index.html -->
<p><strong>Dernière mise à jour :</strong> [DATE]</p>
<p><strong>Last updated:</strong> [DATE]</p>
```

### Vérifier les liens

Périodiquement, vérifier que :
- Les liens internes fonctionnent (/, /privacy, /terms)
- Le lien Play Store est à jour
- L'email de contact est valide

## 📞 Support

Pour toute question : quietstor.app@gmail.com

---

**Note :** Ce site est séparé du repository principal de l'application (`PrivateFileManager`) pour des raisons de simplicité et de déploiement.

