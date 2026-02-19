# Sesion 4: Primer hands-on con Laravel

En este entorno vamos a instalar y configurar Laravel desde cero.

## Que tiene este entorno

- PHP 8.2
- Composer
- Node.js 20
- SQLite

## Que vamos a hacer

1. Instalar Laravel:
   ```bash
   composer create-project laravel/laravel:^12.0 .
   ```

2. Configurar la base de datos (SQLite):
   ```bash
   touch database/database.sqlite
   ```
   Editar `.env` y cambiar `DB_CONNECTION=sqlite`

3. Ejecutar migraciones:
   ```bash
   php artisan migrate
   ```

4. Iniciar el servidor:
   ```bash
   php artisan serve --host=0.0.0.0
   ```

## Si algo falla

Cambia a la rama `sesion4-completo` que tiene todo pre-instalado:
```bash
# O crea un nuevo Codespace desde la rama sesion4-completo
```
