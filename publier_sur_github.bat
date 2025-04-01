@echo off
REM === Script de publication GitHub pour Windows ===
REM Modifie les lignes ci-dessous AVANT de lancer

SET "GITHUB_USERNAME=Nohud"
SET "REPO_NAME=bgg-cors-proxy"

REM === Étapes Git ===
echo Initialisation du dépôt Git local...
git init

echo Ajout des fichiers au commit...
git add .

echo Création du commit initial...
git commit -m "Initial commit"

echo Connexion au dépôt distant...
git remote add origin https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git

echo Envoi du code vers GitHub...
git push -u origin master

echo.
echo ✅ Terminé ! Vérifie ici : https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
pause
