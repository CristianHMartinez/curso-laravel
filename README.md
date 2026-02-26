# Sesion 7: Base de datos y Eloquent

Este entorno viene con un **Directorio de Empleados** ya funcionando con datos hardcoded en el controller. Hoy lo migraremos a una base de datos real.

## Que incluye

- PHP 8.2 + Composer + Node.js 20
- Laravel 12 con SQLite configurado
- Controller con datos de ejemplo (array)
- 4 vistas con estilos: index, show, create, edit
- Rutas individuales configuradas

## Como usarlo

1. Espera a que el entorno termine de configurarse
2. El servidor se inicia automaticamente
3. Codespace abrira una pestana con la aplicacion
4. Si no se abre, ve a la pestana **PORTS** y haz clic en el puerto 8000
5. Navega a `/directorio` para ver el listado de empleados

> **Nota:** Si necesitas reiniciar el servidor manualmente:
> ```bash
> php artisan serve --host=0.0.0.0
> ```

## Que haremos hoy

1. Crear una **migracion** para la tabla `empleados`
2. Crear un **modelo** Eloquent
3. Modificar el **controller** para usar Eloquent en vez del array
4. Simplificar las rutas con `Route::resource`

## Archivos importantes

| Archivo | Que es |
|---------|--------|
| `app/Http/Controllers/DirectorioController.php` | Controller con array hardcoded |
| `routes/web.php` | Rutas individuales |
| `resources/views/directorio/*.blade.php` | Las 4 vistas |
| `database/migrations/` | Aqui crearas tu migracion |
| `app/Models/` | Aqui crearas tu modelo |
