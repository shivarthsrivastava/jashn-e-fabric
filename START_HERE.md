# ⚠️ CORS Error Fix

If you're seeing a CORS error like:
```
Access to internal resource at 'file:///manifest.json' from origin 'null' has been blocked by CORS policy
```

**This means you're opening the HTML file directly from your file system.**

## Solution: Use a Web Server

You MUST serve the app through HTTP/HTTPS. Here's how:

### Quick Fix:
```bash
# In this directory, run:
python3 -m http.server 8000
```

Then open **http://localhost:8000** in your browser (NOT file://)

### Or use the serve script:
```bash
./serve.sh
```

### Why?
Browsers block file:// protocol requests for security reasons. GitHub Pages will serve it correctly over HTTPS, but for local testing, you need a web server.

