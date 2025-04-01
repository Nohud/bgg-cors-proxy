@echo off
REM === Script Windows : Met à jour ton dépôt Git avec les fichiers du proxy corrigé ===

REM 📁 Indique le chemin complet vers ton dossier Git local ici :
SET "DEPOT_PATH=C:\Users\Provensite\bgg-proxy\bgg-cors-proxy"

REM 📁 Indique le chemin complet du dossier extrait depuis le zip corrigé :
SET "CORRIGE_PATH=C:\Users\Provensite\UBAS Dropbox\Arnaud AMEDEO\Mon PC (DESKTOP-N9CB9KE)\Downloads\bgg-cors-proxy-secure"

REM === Copie les fichiers corrigés dans ton dépôt ===
echo 🚚 Copie des fichiers depuis "%CORRIGE_PATH%" vers "%DEPOT_PATH%"...
xcopy /Y /S /I "%CORRIGE_PATH%\*" "%DEPOT_PATH%"

REM === Accès au dossier du dépôt ===
cd /D "%DEPOT_PATH%"

REM === Commit & Push ===
echo ✅ Commit des changements...
git add .
git commit -m "Mise à jour du proxy avec correctif CORS"
git push

echo.
echo 🎉 Terminé ! Ton dépôt GitHub est à jour, et Render va se redéployer.
pause
