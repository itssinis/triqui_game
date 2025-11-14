# Juego de Triqui (Tic-Tac-Toe)

Un juego interactivo de Triqui (Tres en Raya) desarrollado con Flutter, utilizando el patrón de arquitectura BLoC para la gestión de estado.

## Descripción

Este proyecto es una aplicación móvil que implementa el clásico juego de Tic-Tac-Toe (Triqui), donde dos jugadores se turnan para marcar espacios en una cuadrícula de 3x3 con el objetivo de formar una línea horizontal, vertical o diagonal con tres de sus símbolos.

## Características

- ✅ Juego de dos jugadores (X y O)
- ✅ Interfaz intuitiva y responsiva
- ✅ Detección automática de ganador o empate
- ✅ Reinicio de partidas
- ✅ Arquitectura limpia con BLoC Pattern
- ✅ Compatible con múltiples plataformas (iOS, Android, Web, Windows, macOS, Linux)

## Librerías Utilizadas

### Dependencias Principales
- **flutter** - Framework UI de Google para aplicaciones multiplataforma
- **flutter_bloc** (v8.1.4) - Gestión de estado con patrón BLoC
- **bloc** (v8.1.2) - Librería core para eventos y estados
- **equatable** (v2.0.5) - Comparación de objetos simplificada
- **cupertino_icons** (v1.0.8) - Iconos en estilo iOS

### Dependencias de Desarrollo
- **flutter_test** - Testing para aplicaciones Flutter
- **flutter_lints** (v5.0.0) - Análisis de código y mejores prácticas

## Arquitectura

El proyecto sigue la arquitectura **BLoC Pattern**:

```
lib/
├── main.dart              # Punto de entrada de la aplicación
├── bloc/                  # Lógica de negocio
│   ├── game_bloc.dart    # BLoC principal
│   ├── game_event.dart   # Eventos del juego
│   └── game_state.dart   # Estados del juego
├── models/               # Modelos de datos
├── repositories/         # Acceso a datos
├── screens/             # Pantallas de la aplicación
└── widgets/             # Componentes reutilizables
```

## Requisitos Previos

- Flutter SDK: ^3.9.2
- Dart SDK incluido en Flutter
- Un editor (VS Code, Android Studio, etc.)

## Instalación

1. **Clonar el repositorio**
   ```bash
   git clone <url-del-repositorio>
   cd triqui_game
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## Desarrollo

### Ejecutar en diferentes plataformas

```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# Web
flutter run -d chrome

# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

### Análisis de código
```bash
flutter analyze
```

### Formateo de código
```bash
dart format .
```

## Estructura del Juego

- **Tablero (Board)**: Cuadrícula de 3x3 donde se juega
- **Celdas (Cells)**: Espacios individuales que pueden ser marcados
- **Estados**: Juego en progreso, ganador encontrado, empate

## Cómo Jugar

1. El juego comienza con el jugador X
2. Los jugadores se turnan haciendo clic en las celdas vacías
3. El primer jugador en conseguir tres de sus símbolos en línea (horizontal, vertical o diagonal) gana
4. Si todas las celdas se llenan sin ganador, es un empate
5. Usa el botón de reinicio para jugar de nuevo

## Recursos Útiles

- [Documentación oficial de Flutter](https://docs.flutter.dev/)
- [Flutter BLoC Library](https://bloclibrary.dev/)
- [Dart Documentation](https://dart.dev/)

## Licencia

Este proyecto está disponible bajo la licencia MIT.

## Autor

Proyecto creado como ejercicio educativo en Flutter y BLoC Pattern.
