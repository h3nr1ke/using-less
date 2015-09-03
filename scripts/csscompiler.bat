:: Compila o css gerado dentro da pasta less
:: Necessario instalar o node.js (https://nodejs.org/)
:: e instalar o less compiler (http://lesscss.org/)

@echo off
SET thepath=%~dp0

::utf 8
chcp 65001

cscript %thepath%csscompiler.vbs
