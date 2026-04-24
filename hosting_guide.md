# Hosting this project — step-by-step

This document contains step-by-step hosting instructions for several popular static hosting providers. Run the commands from the repository root (where `index.html` is).

1) Quick local preview (Node fallback)

   - If you have Node.js installed, run:

       node serve.js

     Then open http://localhost:8000/ in your browser.

   - If you have Python installed (optional):

       python server.py


2) Firebase Hosting (recommended — supports custom headers)

Prerequisites: Node.js + npm, Firebase account

   a) Install Firebase CLI globally:

       npm install -g firebase-tools

   b) Login interactively:

       firebase login

   c) Initialize hosting (run once):

       firebase init hosting

      - When prompted, choose your Firebase project or create a new one.
      - Set the public directory to `.` (the repo root).
      - When asked to configure as a single-page app, answer based on your app — usually `No` for static sites.
      - If asked to overwrite `index.html`, choose `No`.

   d) Deploy to Firebase Hosting:

       firebase deploy --only hosting

   Notes: This repo includes a `firebase.json` which sets the Cross-Origin-Embedder-Policy and Cross-Origin-Opener-Policy headers.


3) Netlify

   Option A — drag & drop (no CLI): zip the repo contents (exclude `node_modules`) and upload at https://app.netlify.com/drop

   Option B — CLI deploy (fast):

       npm install -g netlify-cli
       netlify login
       netlify deploy --prod --dir=.

   Notes: Netlify allows custom headers via a `_headers` file. If you need COEP/COOP headers, create a `_headers` file with the headers and include it in the repo root:

       /*
         Cross-Origin-Embedder-Policy: require-corp
         Cross-Origin-Opener-Policy: same-origin


4) GitHub Pages

   - Push the repo to a GitHub repository.
   - In repository Settings → Pages, choose branch `main` (or `master`) and / (root) as the folder.
   - Note: GitHub Pages doesn't support custom HTTP response headers directly. To set COEP/COOP you need a CDN or a proxy (Cloudflare, Netlify) in front of the Pages site.


5) Vercel

   - Install Vercel CLI (optional):

       npm i -g vercel

   - Deploy interactively:

       vercel --prod

   Notes: Vercel supports headers via `vercel.json` configuration if needed.


6) Automating deploys (GitHub Actions → Firebase example)

   - Create a GitHub Actions workflow that runs on push to `main` and deploys using `firebase-tools`.
   - Store a Firebase CI token as `FIREBASE_DEPLOY_TOKEN` in GitHub repository secrets (get token via `firebase login:ci`).

   Example job steps:

     - name: Install Node
       uses: actions/setup-node@v3
       with:
         node-version: '18'

     - name: Install Firebase CLI
       run: npm install -g firebase-tools

     - name: Deploy to Firebase
       env:
         FIREBASE_TOKEN: ${{ secrets.FIREBASE_DEPLOY_TOKEN }}
       run: firebase deploy --only hosting --token $FIREBASE_TOKEN


7) Troubleshooting

   - 403 or CORS errors: ensure headers are applied and your resources are served from same origin or allowed sources.
   - Missing files: check that `index.html` exists in the public directory you configured.
   - HTTPS: Hosting providers supply HTTPS by default — some features require cross-origin isolation headers which we set in `firebase.json` / `_headers`.


If you want, I can generate a ready-to-use GitHub Actions workflow or Netlify `_headers` file for you, or I can produce a PDF of this guide (I'll create it now if you want). 
