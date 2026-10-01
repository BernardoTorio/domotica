@echo off
REM Publica los cambios del repo "domotica" en GitHub Pages (doble clic)
cd /d C:\dev\domotica
git add -A
git commit -m "Actualizacion %date% %time%"
git push
echo.
echo Publicado en https://bernardotorio.github.io/domotica/
pause
