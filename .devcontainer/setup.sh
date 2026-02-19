#!/bin/bash
# ============================================================
# Setup — Sesion 4: Entorno desde cero
# Solo instala servicios. Los estudiantes instalan Laravel.
# ============================================================

# Optimizaciones de rendimiento
export XDEBUG_MODE=off
sudo phpdismod xdebug 2>/dev/null || true

echo ""
echo "=========================================="
echo "  Preparando entorno de desarrollo..."
echo "=========================================="
echo ""

# 1. Instalar SQLite + configurar OPcache
echo "[1/2] Instalando dependencias..."
sudo apt-get update -qq && sudo apt-get install -y -qq php8.2-sqlite3 > /dev/null 2>&1 || true

echo "opcache.enable=1
opcache.enable_cli=1
opcache.memory_consumption=128
opcache.max_accelerated_files=10000
opcache.validate_timestamps=1
opcache.revalidate_freq=0" | sudo tee /etc/php/8.2/mods-available/opcache-dev.ini > /dev/null 2>&1
sudo phpenmod opcache-dev 2>/dev/null || true

# 2. Verificar herramientas
echo "[2/2] Verificando herramientas..."
echo ""

ERRORS=0

if command -v php &> /dev/null; then
    echo "  PHP:      $(php -v | head -1 | cut -d' ' -f2)"
else
    echo "  PHP:      NO ENCONTRADO"
    ERRORS=$((ERRORS + 1))
fi

if command -v composer &> /dev/null; then
    echo "  Composer: $(composer --version 2>/dev/null | head -1)"
else
    echo "  Composer: NO ENCONTRADO"
    ERRORS=$((ERRORS + 1))
fi

if command -v node &> /dev/null; then
    echo "  Node.js:  $(node --version)"
else
    echo "  Node.js:  NO ENCONTRADO"
    ERRORS=$((ERRORS + 1))
fi

if php -m 2>/dev/null | grep -qi sqlite; then
    echo "  SQLite:   disponible"
else
    echo "  SQLite:   NO DISPONIBLE"
    ERRORS=$((ERRORS + 1))
fi

echo ""

if [ $ERRORS -gt 0 ]; then
    echo "=========================================="
    echo "  Hay $ERRORS herramienta(s) con problemas"
    echo "  Intenta reconstruir el contenedor"
    echo "=========================================="
else
    echo "=========================================="
    echo "  Entorno listo - todas las herramientas OK"
    echo "=========================================="
    echo ""
    echo "  Siguiente paso: instalar Laravel"
    echo "  composer create-project laravel/laravel:^12.0 ."
    echo ""
fi
