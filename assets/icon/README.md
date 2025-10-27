# Icon Assets

Coloca aquí los siguientes archivos de imagen:

## Requeridos:
- `icon.png` - Ícono principal de la app (1024x1024px recomendado)
- `icon_foreground.png` - Ícono para Android adaptive icon (432x432px con área segura de 108dp)

## Cómo crear los íconos:

### Opción 1: Crear manualmente
1. Crea una imagen de 1024x1024px con tu diseño
2. Guárdala como `icon.png`
3. Crea una versión del foreground (la parte que se adaptará) de 432x432px
4. Guárdala como `icon_foreground.png`

### Opción 2: Usar herramientas online
- [icon.kitchen](https://icon.kitchen/) - Generador de íconos para Android
- [appicon.co](https://appicon.co/) - Generador de íconos multiplataforma

### Opción 3: Diseño simple (placeholder)
Por ahora, puedes usar un ícono simple con el texto "TODO" o un checkmark.

## Colores usados en la configuración:
- Background del adaptive icon: #1E88E5 (azul)

## Después de agregar las imágenes, ejecuta:
```bash
dart run flutter_launcher_icons
```
