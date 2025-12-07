# Jashn-e-Fabric Web Application

This is the built web application for Jashn-e-Fabric, ready for GitHub Pages deployment.

## GitHub Pages Setup

1. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Initial web build"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   git push -u origin main
   ```

2. **Enable GitHub Pages:**
   - Go to your repository on GitHub
   - Click on **Settings** → **Pages**
   - Under **Source**, select **Deploy from a branch**
   - Choose **main** branch and **/ (root)** folder
   - Click **Save**
   - Your site will be available at: `https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/`

## Running Locally

⚠️ **IMPORTANT:** You MUST serve this app through a web server (HTTP/HTTPS). Opening `index.html` directly in a browser will cause CORS errors!

### Option 1: Using the serve script (Recommended)
```bash
./serve.sh
```
Then open http://localhost:8000 in your browser.

### Option 2: Python HTTP Server
```bash
python3 -m http.server 8000
```
Then open http://localhost:8000 in your browser.

### Option 3: Node.js http-server
```bash
npx http-server -p 8000
```
Then open http://localhost:8000 in your browser.

### Option 4: Using Flutter's dev server
From the parent Flutter project directory:
```bash
cd ../..
flutter run -d chrome --web-port=8080
```

## Updating the Build

When you rebuild the Flutter app, copy the new files from `build/web/` to this directory and commit:
```bash
git add .
git commit -m "Update web build"
git push
```

