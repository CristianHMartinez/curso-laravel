#!/bin/bash
# ============================================================
# Setup — Sesion 4: Entorno completo (Laravel pre-instalado)
# Se ejecuta automaticamente al crear el devcontainer
# ============================================================

# Optimizaciones de rendimiento
export XDEBUG_MODE=off
sudo phpdismod xdebug 2>/dev/null || true

echo ""
echo "Configurando entorno Laravel..."
echo ""

# 1. Instalar SQLite + OPcache
echo "[1/4] Instalando dependencias..."
sudo apt-get update -qq && sudo apt-get install -y -qq php8.2-sqlite3 > /dev/null 2>&1 || true

echo "opcache.enable=1
opcache.enable_cli=1
opcache.memory_consumption=128
opcache.max_accelerated_files=10000
opcache.validate_timestamps=1
opcache.revalidate_freq=0" | sudo tee /etc/php/8.2/mods-available/opcache-dev.ini > /dev/null 2>&1
sudo phpenmod opcache-dev 2>/dev/null || true

# 2. Verificar composer
if ! command -v composer &> /dev/null; then
    echo "ERROR: composer no esta instalado."
    exit 1
fi

# 3. Instalar o restaurar Laravel
if [ -f "artisan" ]; then
    echo "[2/4] Proyecto Laravel ya existe, reinstalando dependencias..."
    composer install --no-interaction 2>&1
else
    echo "[2/4] Creando proyecto Laravel 12..."

    if ! composer create-project laravel/laravel:^12.0 /tmp/laravel-install --no-interaction 2>&1; then
        echo ""
        echo "ERROR: No se pudo crear el proyecto Laravel."
        echo "  Intenta reconstruir el contenedor con conexion a internet."
        exit 1
    fi

    echo "Moviendo archivos al workspace..."
    cp -rn /tmp/laravel-install/. . 2>/dev/null || true
    cp -r /tmp/laravel-install/. . 2>/dev/null || true
    rm -rf /tmp/laravel-install

    # 4. Configurar SQLite
    echo "[3/4] Configurando base de datos SQLite..."
    touch database/database.sqlite

    sed -i 's/DB_CONNECTION=.*/DB_CONNECTION=sqlite/' .env
    sed -i '/^DB_HOST=/d' .env
    sed -i '/^DB_PORT=/d' .env
    sed -i '/^DB_DATABASE=/d' .env
    sed -i '/^DB_USERNAME=/d' .env
    sed -i '/^DB_PASSWORD=/d' .env

    WORKSPACE_DIR=$(pwd)
    sed -i "s|DB_CONNECTION=sqlite|DB_CONNECTION=sqlite\nDB_DATABASE=${WORKSPACE_DIR}/database/database.sqlite|" .env
fi

# 5. Migraciones
echo "[4/4] Ejecutando migraciones..."
touch database/database.sqlite
php artisan migrate --force 2>&1 || echo "Migraciones fallaron — ejecuta: php artisan migrate"

# 6. Verificacion
echo ""
echo "============================================"
echo "  Entorno Laravel configurado con exito"
echo "============================================"
echo ""
echo "  Laravel: $(php artisan --version 2>/dev/null || echo 'no detectado')"
echo "  PHP:     $(php -v | head -1 | cut -d' ' -f2)"
echo "  SQLite:  configurado"
echo ""
echo "  Para iniciar el servidor:"
echo "     php artisan serve --host=0.0.0.0"
echo ""
