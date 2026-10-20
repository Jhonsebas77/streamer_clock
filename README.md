# Streamer Clock

[![Flutter](https://img.shields.io/badge/Flutter-3.41.6-02569B?logo=flutter&logoColor=white)](https://docs.flutter.dev/release/archive)
[![Dart](https://img.shields.io/badge/Dart-3.11.4-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Deploy](https://github.com/Jhonsebas77/streamer_clock/actions/workflows/deploy-web.yml/badge.svg)](https://github.com/Jhonsebas77/streamer_clock/actions/workflows/deploy-web.yml)

![Android](https://img.shields.io/badge/Android_7.0+_(API_24)-3DDC84?logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS_15+-000000?logo=apple&logoColor=white)
![macOS](https://img.shields.io/badge/macOS_12+-000000?logo=apple&logoColor=white)
[![Web](https://img.shields.io/badge/Web-4285F4?logo=googlechrome&logoColor=white)](https://jhonsebas77.github.io/streamer_clock/)
![Windows](https://img.shields.io/badge/Windows-0078D4?logo=windows&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=black)

![Streamer Clock Logo](https://i.ibb.co/1TRdqDJ/app-icon-128.png)

Un reloj digital diseñado para streamers, que muestra la hora y la fecha en tiempo real con un diseño minimalista ideal para overlays de streaming.

**Demo en vivo:** https://jhonsebas77.github.io/streamer_clock/

> Para usarlo en OBS/Streamlabs, agrega una fuente de **Navegador** con esa URL.

## Funcionalidades

- **Hora en tiempo real** - Formato 12h (AM/PM), se actualiza justo al cambiar cada minuto
- **Fecha actual** - Día de la semana, día y mes en español (`LUN, 19 OCT`)
- **Diseño adaptable** - Si el espacio es muy angosto, la fecha se coloca sobre la hora sin desbordarse
- **Diseño minimalista** - Tema oscuro con acentos en verde brillante, perfecto para OBS/Streamlabs
- **Multiplataforma** - Web, Android, iOS, macOS, Windows y Linux
- **Widget de Android** - Widget nativo para la pantalla de inicio

## Captura de pantalla

![Streamer Clock Screenshot](https://i.ibb.co/5MmtPNR/Screen-Shot-2022-06-19-at-6-30-13-PM.png)

## Requisitos

- **Flutter SDK** 3.41+, Dart 3.11+
- **Android** 7.0+ (API 24)
- **iOS** 15.0+
- **macOS** 12.0+ para ejecutar la app de escritorio (y Xcode con CocoaPods para compilarla)

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

### Validacion

```bash
flutter analyze
flutter test
```

Los tests verifican que fecha y hora se muestren en una fila en pantallas anchas y que se apilen sin overflow en pantallas angostas.

## Despliegue web

Cada push a `main` publica la versión web en **[GitHub Pages](https://jhonsebas77.github.io/streamer_clock/)** mediante el workflow `.github/workflows/deploy-web.yml`, que corre `flutter analyze`, `flutter test` y `flutter build web` antes de desplegar. También se puede lanzar manualmente desde la pestaña **Actions** → *Deploy web to GitHub Pages* → *Run workflow*.

## Estructura del proyecto

```
lib/
├── main.dart                 # Entry point: inicializa el formato de fechas es_CO
└── ui/
    ├── styles/
    │   ├── styles.dart       # Export estilos
    │   └── text_styles.dart  # Estilos de texto
    ├── theme/
    │   ├── colors.dart       # Paleta de colores
    │   └── theme.dart        # Configuracion ThemeData
    ├── views/
    │   ├── app.dart          # MyApp widget principal
    │   ├── home.dart         # HomeView: reloj que se actualiza cada minuto
    │   └── view.dart         # Library exports
    └── widgets/
        ├── widgets.dart      # Export widgets
        ├── date.dart         # DateWidget
        └── time.dart         # TimeWidget

android/app/src/main/
├── kotlin/com/ota_labs/streamer_clock/
│   ├── MainActivity.kt
│   └── StreamerClockWidgetReceiver.kt  # Widget de pantalla de inicio
└── res/
    ├── layout/streamer_clock_widget.xml
    └── xml/streamer_clock_widget_info.xml
```

## Dependencias

| Paquete | Version | Descripcion |
|---------|---------|-------------|
| `flutter` | SDK | Framework principal |
| `intl` | ^0.20.2 | Formateo de fechas |

## Identificadores de la app

| Plataforma | Identificador |
|------------|---------------|
| Android, Linux | `com.ota_labs.streamer_clock` |
| iOS, macOS | `com.otaLabs.streamerClock` |

Apple no permite `_` en los bundle IDs, por eso iOS y macOS usan camelCase.

## Widget de Android

El widget es 100 % nativo (Kotlin) y no depende de la app de Flutter:

- **Hora**: usa un `TextClock`, que el sistema actualiza cada minuto sin que la app tenga que estar abierta.
- **Fecha**: `StreamerClockWidgetReceiver` la actualiza al agregar el widget, con una alarma a medianoche y cuando cambian la hora, la zona horaria o el idioma del dispositivo. La alarma de medianoche es inexacta, así que con el teléfono en reposo (Doze) la fecha puede tardar en cambiar.

Para agregarlo: mantener presionada la pantalla de inicio → Widgets → Streamer Clock.

## Personalizacion

### Colores

Editar `lib/ui/theme/colors.dart`:

```dart
class Colors {
  static const Color green_brillant = Color(0xFFA6D60E);  // Cambia este color
}
```

En el widget de Android, los colores están en `android/app/src/main/res/values/colors.xml`.

### Formato de fecha/hora

- App: editar `lib/ui/widgets/time.dart` y `lib/ui/widgets/date.dart`.
- Widget de Android: la hora se configura en `streamer_clock_widget.xml` (`android:format12Hour`) y la fecha en `StreamerClockWidgetReceiver.kt`.

## Licencia

MIT License
