@echo off
REM Solo la PRIMERA vez. Antes, crea en github.com el repositorio vacio "domotica"
REM (Public, sin README). Despues ejecuta este archivo desde C:\dev\domotica
cd /d C:\dev\domotica
git init
git branch -M main
git add -A
git commit -m "Primera version: animaciones P1 y tema 1"
git remote add origin https://github.com/BernardoTorio/domotica.git
git push -u origin main
echo.
echo Ahora en GitHub: Settings - Pages - Branch: main / (root) - Save
pause
