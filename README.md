# Hosting this project live

This repository is a static site that can be hosted on many platforms. Below are quick instructions for three common hosts: Firebase Hosting (recommended if you want the COEP/COOP headers), Netlify, and GitHub Pages.

Prerequisites
- Node.js and npm (for Firebase or Netlify CLI)
- A GitHub account (for GitHub Pages or Netlify)

Option A — Firebase Hosting (recommended)
1. Install the Firebase CLI:

   npm install -g firebase-tools

2. Login and initialize (run in the repo root):

   firebase login
   firebase init hosting

   - Choose an existing Firebase project or create a new one.
   - Set the public directory to `.` (the repo root).
   - Do not overwrite `index.html` when prompted.

3. Deploy:

   firebase deploy --only hosting

This repo includes a `firebase.json` that sets the Cross-Origin-Embedder-Policy and Cross-Origin-Opener-Policy headers required by some modern browser features.

Option B — Netlify
1. Install Netlify CLI (optional for direct deploy):

   npm install -g netlify-cli

2. Deploy quickly via drag-and-drop: zip the repo contents (but not node_modules) and upload to app.netlify.com.

3. Or use CLI:

   netlify login
   netlify deploy --prod --dir=.

Option C — GitHub Pages
1. Create a repository on GitHub and push this project.
2. In repository settings > Pages, select the `main` (or `master`) branch and `/ (root)` as the folder.

Notes
- If you need server-side code (APIs), consider Vercel or Netlify Functions.
- If you prefer Python's `server.py` locally, install Python and run `python server.py`.
- I added `serve.js` so you can run a local server with Node immediately: `node serve.js`.

If you'd like, I can:
- Add a `start_server.bat` that prefers Python but falls back to Node.
- Create a GitHub Actions workflow to auto-deploy to Firebase on push to `main`.

Tell me which hosting option you want and I'll configure the repo end-to-end (CI/CD, deployment config, and a working demo URL if credentials are available).
