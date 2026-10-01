@echo off
chcp 65001 >nul
title Subir Domotica a GitHub
setlocal enabledelayedexpansion
cd /d "%~dp0"

set "WEB=https://bernardotorio.github.io/domotica/"
set "DESC=%USERPROFILE%\Downloads"

echo ============================================
echo   Subir Domotica (2MT) a GitHub
echo   Carpeta: %CD%
echo ============================================
echo.

rem --- 1. Buscar domotica.zip: primero en esta carpeta, luego en Descargas ---
set "ZIP="
for %%f in ("%CD%\domotica*.zip") do (
  echo %%~nf | findstr /i "_subido" >nul || set "ZIP=%%~ff"
)
if not defined ZIP (
  for %%f in ("%DESC%\domotica*.zip") do (
    echo %%~nf | findstr /i "_subido" >nul || set "ZIP=%%~ff"
  )
)

for /f %%d in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmm"') do set "STAMP=%%d"

if defined ZIP (
  echo Encontrado: !ZIP!
  echo Contenido del zip:
  tar -tf "!ZIP!"
  echo.
  tar -xf "!ZIP!" -C "%CD%"
  if errorlevel 1 (
    echo ERROR al descomprimir el zip.
    goto fin
  )
  move /y "!ZIP!" "%DESC%\domotica_subido_!STAMP!.zip" >nul
  echo Zip descomprimido y apartado en Descargas como domotica_subido_!STAMP!.zip
  echo.
) else (
  echo No hay ningun domotica.zip nuevo: se sube lo que haya en la carpeta.
  echo.
)

rem --- 2. Ordenar: los PDF van en temas\ y practicas\, no en la raiz ---
if not exist "temas" mkdir "temas"
if not exist "practicas" mkdir "practicas"
if exist "tema1-sensores-actuadores.pdf" move /y "tema1-sensores-actuadores.pdf" "temas\" >nul
if exist "2MT-P1.pdf" move /y "2MT-P1.pdf" "practicas\" >nul
if exist "2MT-P2.pdf" move /y "2MT-P2.pdf" "practicas\" >nul
if exist "primera_vez.bat" del /q "primera_vez.bat"
if not exist ".nojekyll" type nul > ".nojekyll"

rem --- 3. Nunca subir zips ni docx ---
findstr /x /c:"*.zip" .gitignore >nul 2>&1 || echo *.zip>>.gitignore
findstr /x /c:"*.docx" .gitignore >nul 2>&1 || echo *.docx>>.gitignore
git rm -r --cached -q --ignore-unmatch *.zip *.docx >nul 2>&1

rem --- 4. Commit y push ---
git add -A
git diff --cached --quiet
if not errorlevel 1 (
  echo No hay cambios que subir: todo esta ya en GitHub.
  goto listo
)
echo Archivos que cambian:
git diff --cached --name-status
echo.
git commit -q -m "Actualizacion %date% %time:~0,5%"
git push -u origin main
if errorlevel 1 (
  echo.
  echo *** ERROR al subir. Revisa el mensaje de arriba. ***
  goto fin
)

:listo
echo.
echo Publicado en %WEB%
echo (tarda uno o dos minutos; recarga con Ctrl+F5)

:fin
echo.
pause
