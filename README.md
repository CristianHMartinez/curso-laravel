# Sesion 9: Blog con AdminLTE

Este entorno viene con el **layout AdminLTE ya instalado**. Hoy construiremos un Blog desde cero aplicando todo lo aprendido en sesiones anteriores.

## Que incluye

- PHP 8.2 + Composer + Node.js 20
- Laravel 12 con SQLite configurado
- Layout AdminLTE 3.1 con Bootstrap 4 (listo para usar)
- Sidebar con links a Posts
- Vista welcome con checklist de lo que vamos a crear

## Como usarlo

1. Espera a que el entorno termine de configurarse
2. El servidor se inicia automaticamente
3. Codespace abrira una pestana con la aplicacion
4. Si no se abre, ve a la pestana **PORTS** y haz clic en el puerto 8000
5. Deberias ver el dashboard de AdminLTE con el mensaje de bienvenida

> **Nota:** Si necesitas reiniciar el servidor manualmente:
> ```bash
> php artisan serve --host=0.0.0.0
> ```

## Que haremos hoy

1. Crear un **controller** con `php artisan make:controller PostController --resource`
2. Registrar **rutas** con `Route::resource`
3. Crear una **migracion** para la tabla `posts`
4. Crear un **modelo** Eloquent `Post`
5. Crear **vistas** (index, create, edit, show) usando clases de Bootstrap 4
6. Agregar **validacion** y **flash messages**
7. Crear **categorias** con relacion 1:N (`hasMany` / `belongsTo`)

## Archivos importantes

| Archivo | Que es |
|---------|--------|
| `resources/views/layouts/app.blade.php` | Layout AdminLTE (ya incluido) |
| `resources/views/layouts/sidebar.blade.php` | Menu lateral (ya incluido) |
| `routes/web.php` | Aqui agregaras Route::resource |
| `app/Http/Controllers/` | Aqui crearas tu controller |
| `app/Models/` | Aqui crearas tus modelos |
| `database/migrations/` | Aqui crearas tus migraciones |
| `resources/views/posts/` | Aqui crearas tus vistas |
