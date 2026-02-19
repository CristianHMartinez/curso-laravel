# Curso Laravel - SSPM

Repositorio de entornos de desarrollo para el curso de Laravel.

## Como usar este repositorio

Cada sesion tiene su propia rama con un entorno de desarrollo listo para usar.

### Opcion 1: GitHub Codespaces (recomendada)

1. Ve a la rama de la sesion que necesitas (ejemplo: `sesion4`)
2. Click en **Code** > **Codespaces** > **Create codespace on sesion4**
3. Espera a que se configure el entorno (~2 minutos)
4. Listo. Tienes VS Code en el navegador con todo funcionando

### Opcion 2: VS Code + Docker (local)

1. Clona el repositorio y cambia a la rama de la sesion:
   ```bash
   git clone <url-del-repo>
   cd curso-laravel-sspm
   git checkout sesion4
   ```
2. Abre la carpeta en VS Code
3. Cuando aparezca "Reopen in Container", acepta
4. Espera a que se configure el entorno

## Ramas disponibles

| Rama | Descripcion |
|------|-------------|
| `main` | Este README |
| `sesion4` | Sesion 4: Primer hands-on con Laravel (entorno desde cero) |
| `sesion4-completo` | Sesion 4: Entorno con Laravel ya instalado (fallback) |

## Notas

- Cada Codespace es independiente. Tus cambios no afectan a otros estudiantes.
- Si necesitas empezar de cero, elimina tu Codespace y crea uno nuevo.
- Las sesiones futuras se agregaran como nuevas ramas.
