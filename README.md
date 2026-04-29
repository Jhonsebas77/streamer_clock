# Streamer Clock

![Streamer Clock Logo](https://i.ibb.co/1TRdqDJ/app-icon-128.png)

Un reloj digital diseñado para streamers,displaying la hora y fecha en tiempo real con un diseño minimalista ideal para overlays de streaming.

## Funcionalidades

- **Hora en tiempo real** - Se Actualiza cada segundo en formato 12h (AM/PM)
- **Fecha actual** - Muestra el día de la semana, día y mes en español
- **Diseño minimalista** - Tema oscuro con acentos en verde brillante, perfecto para OBS/Streamlabs
- **Multiplataforma** - Funciona en Web, Android, iOS y macOS
- **Widget de Home** - Soporte para widget en Android/iOS (funcionalidad nativa)

## Captura de pantalla

![Streamer Clock Screenshot](https://i.ibb.co/5MmtPNR/Screen-Shot-2022-06-19-at-6-30-13-PM.png)

## Requisitos

- **Flutter SDK** 3.41+, Dart 3.11+
- **Node.js** (opcional, para desarrollo web)

## Instalación

```bash
# Clonar el repositorio
git clone <repo-url>
cd streamer_clock

# Instalar dependencias
flutter pub get
```

## Como levantarlo

### Desarrollo

```bash
# Web
flutter run -d chrome

# macOS
flutter run -d macos

# Android
flutter run -d android

# iOS (solo macOS)
flutter run -d ios
```

### Produccion

```bash
# Build Web
flutter build web

# Build macOS
flutter build macos

# Build Android APK
flutter build apk

# Build iOS (solo macOS)
flutter build ios
```

## Estructura del proyecto

```
lib/
├── main.dart                 # Entry point
└── ui/
    ├── fonts/
    │   ├── fonts.dart        # Export fuentes
    │   └── ui_icons.dart     # Iconos UI
    ├── styles/
    │   ├── styles.dart       # Export estilos
    │   └── text_styles.dart  # Estilos de texto
    ├── theme/
    │   ├── colors.dart       # Paleta de colores
    │   └── theme.dart        # Configuracion ThemeData
    ├── views/
    │   ├── app.dart          # MyApp widget principal
    │   ├── home.dart         # HomeView interfaz principal
    │   ├── localizations.dart # Configuracion i18n
    │   ├── view.dart         # Library exports
    │   └── home_widget/
    │       └── worker.dart   # Workmanager callbacks
    └── widgets/
        ├── widgets.dart      # Export widgets
        ├── date.dart         # DateWidget
        └── time.dart         # TimeWidget
```

## Dependencias

| Paquete | Version | Descripcion |
|---------|---------|-------------|
| `flutter` | SDK | Framework principal |
| `easy_localization` | ^3.0.7 | Internacionalizacion |
| `intl` | ^0.20.2 | Formateo de fechas |
| `home_widget` | ^0.7.0 | Widgets nativos |
| `workmanager` | ^0.5.2 | Tareas en background |

## Configuracion

### Web

El proyecto usa la API moderna de Flutter Web. No requiere configuracion adicional.

### iOS

Requiere configurar el App Group ID en:
- `ios/Runner/Info.plist`
- Apple Developer Portal

### Android

Requiere registrar el HomeWidgetReceiver en:
- `android/app/src/main/AndroidManifest.xml`

## Personalizacion

### Colores

Editar `lib/ui/theme/colors.dart`:

```dart
class Colors {
  static const Color green_brillant = Color(0xFFA6D60E);  // Cambia este color
}
```

### Formato de fecha/hora

Editar `lib/ui/widgets/time.dart` y `lib/ui/widgets/date.dart` para cambiar los formatos.

## Licencia

MIT License