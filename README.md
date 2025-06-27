# Kids & Clouds Agenda 👶🌥️

<div>
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
<img src="https://img.shields.io/badge/version-1.0.0-blue" alt="Version 1.0.0"/>
</div>

<table>
<tr>
<td width="40%">
<img src="assets/giff/KidsAndClouds.gif" alt="Kids & Clouds App Demo" width="100%"/>
</td>
<td width="60%">

## 📝 Descripción del Proyecto

Esta aplicación simula una agenda digital para guarderías, permitiendo a los padres visualizar y filtrar actividades diarias de sus hijos con una interfaz intuitiva y amigable, optimizada tanto para dispositivos móviles como web.

Se ha desarrollado con enfoque en experiencia fluida, interfaz limpia y arquitectura modular mantenible.
</td>
</tr>
</table>

## 📱 Capturas de Pantalla

<div>

| Versión Móvil | Versión Web |
|:-------------:|:-----------:|
| ![Agenda Móvil](assets/screenshots/movilAgenda.png) | ![Agenda Web](assets/screenshots/webAgenda.png) |
| **Agenda** | **Agenda** |
| ![Dashboard Móvil](assets/screenshots/movilDashboard.png) | ![Dashboard Web](assets/screenshots/webDashboard.png) |
| **Dashboard** | **Dashboard** |

</div>

## ✨ Características

**Agenda Diaria**
- Visualización de eventos por día, niño y categoría
- Filtros combinados (niño + categoría) y paginación (5 eventos/página)
- Contador de eventos filtrados y feedback visual instantáneo

**Dashboard**
- Gráfico circular por categorías con paleta de colores consistente
- Estadísticas de actividad por niño con visualización comparativa
- Interfaz adaptativa a móvil/web con disposición optimizada

**Experiencia de Usuario**
- Interfaz responsiva y navegación intuitiva entre secciones
- 7 categorías de eventos con iconografía clara y distintiva
- Animaciones suaves que mejoran la experiencia visual

## 🔧 Tecnologías

**Core**
- Flutter SDK y Dart: Base multiplataforma con rendimiento optimizado
- Material Design 3: Estética moderna y coherente
- Provider: Gestión de estado eficiente

**Librerías**
- Google Fonts: Tipografía Quicksand para estética infantil
- FL Chart: Visualización de datos en el dashboard
- Flutter Animate: Microinteracciones y transiciones
- Cached Network Image: Optimización de carga con caché local
- Robohash API: Avatares únicos para perfiles

**Arquitectura**
- Organización modular por funcionalidades
- Mocks de datos con transición fácil a API real
- Widgets reutilizables para consistencia visual
- Testing estratégico en componentes críticos

## ✨ Animaciones y UI

Implementación de animaciones sutiles que mejoran la experiencia, especialmente adecuadas para una aplicación infantil:

- Transiciones suaves entre pantallas y al mostrar eventos
- Aparición secuencial de elementos en menús y listas
- Efectos visuales coherentes con la temática infantil

## 💻 Estructura del Proyecto

```
/
├─ assets/                      # Recursos estáticos de la aplicación
│   ├─ giff/                 # Animaciones GIF para el README
│   └─ screenshots/         # Capturas de pantalla para documentación
├─ lib/                        # Código fuente principal
│   ├─ main.dart            # Punto de entrada de la aplicación
│   ├─ controllers/         # Controladores de lógica
│   │   └─ pagination_controller.dart
│   ├─ models/              # Modelos de datos
│   │   ├─ child.dart
│   │   └─ event.dart
│   ├─ screens/             # Pantallas principales
│   │   ├─ home_screen.dart
│   │   ├─ agenda_screen.dart
│   │   └─ dashboard_screen.dart
│   ├─ services/            # Servicios y proveedores de datos
│   │   └─ mock_data_service.dart
│   ├─ theme/               # Configuración de tema
│   │   └─ app_theme.dart
│   ├─ utils/               # Utilidades y helpers
│   │   └─ string_extensions.dart
│   └─ widgets/             # Componentes reutilizables
│       ├─ agenda/          # Widgets de la pantalla agenda
│       └─ dashboard/       # Widgets de la pantalla dashboard
├─ test/                       # Pruebas automatizadas
│   ├─ category_filter_test.dart   # Tests de UI de filtros
│   ├─ mock_data_service_test.dart # Tests de lógica de negocio
│   └─ widget_test.dart           # Tests de componentes básicos
├─ pubspec.yaml                # Configuración de dependencias
└─ analysis_options.yaml       # Configuración de análisis estático
```

## ⚙️ Instalación y Ejecución

### Prerrequisitos

- Flutter SDK 3.13.0+ ([guía de instalación](https://flutter.dev/docs/get-started/install))
- Dart SDK 3.1.0+ (incluido con Flutter)
- Un IDE con soporte para Flutter (VS Code o Android Studio)
- Para web: Chrome actualizado

### Pasos de instalación

1. **Obtener el código**
   ```bash
   git clone https://github.com/josee022/kids_and_clouds_agenda.git
   cd kids_and_clouds_agenda
   ```
   _¿Sin Git? [Descarga el ZIP](https://github.com/josee022/kids_and_clouds_agenda/archive/refs/heads/main.zip)_

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

### Ejecución

- **En móvil/emulador:**
  ```bash
  flutter run
  ```
  
  🔍 Probado con éxito en emulador Android (API 36 - Android 16 Baklava).

- **En navegador web:**
  ```bash
  flutter run -d chrome
  ```

### Solución de problemas

Si encuentras problemas durante la instalación:
1. Ejecuta `flutter doctor` para diagnosticar
2. Verifica la conexión de dispositivos con `flutter devices`
3. Para problemas con paquetes: `flutter pub upgrade`

## 🧪 Tests

La aplicación incluye una suite completa de tests automatizados, cumpliendo con los requisitos técnicos del proyecto para garantizar su estabilidad y mantenibilidad.

```bash
flutter test
```

### Estructura de Pruebas

Se han implementado **12 tests** en total, distribuidos en tres archivos que cubren distintos aspectos de la aplicación:

**1. `category_filter_test.dart` - Pruebas de UI y Componentes**
- Verificación de la correcta traducción de nombres de categorías
- Validación de la visualización de chips de filtrado
- Tests de interacción con los filtros y activación de callbacks
- Comprobación del estado visual de los chips seleccionados

**2. `mock_data_service_test.dart` - Pruebas de Lógica de Negocio**
- Filtrado sin criterios (comportamiento por defecto)
- Filtrado por ID de niño (selección de perfil)
- Filtrado por categoría de actividad
- Escenarios de filtrado combinado (niño + categoría)
- Manejo de casos sin coincidencias en los resultados

**3. `widget_test.dart` - Pruebas de Modelos y Widgets Básicos**
- Validación del componente de información de paginación
- Integridad del modelo de datos para eventos
- Verificación de la enumeración de categorías

### Enfoque de Testing

Las pruebas se han diseñado siguiendo buenas prácticas:

- Uso de finders robustos para localizar widgets en estructuras complejas
- Manejo adecuado de animaciones durante las pruebas con `pumpAndSettle()`
- Verificación tanto del comportamiento visual como funcional de los componentes
- Priorización de pruebas en funcionalidades críticas para el usuario

## 💳 Enfoque y Conclusión

La aplicación Kids & Clouds Agenda demuestra mi capacidad para crear soluciones efectivas con Flutter, aplicando:

- **Arquitectura modular** con separación clara de responsabilidades
- **Experiencia de usuario** intuitiva con diseño adaptativo y feedback inmediato
- **Testing completo** que garantiza estabilidad y funcionalidad
- **Optimización de rendimiento** en carga de recursos y navegación

El proyecto cumple todos los requisitos de la prueba técnica, combinando funcionalidad robusta con un diseño atractivo y apropiado para el contexto educativo infantil.

## 👨‍💻 Autor

José Mondelo Álvarez | Desarrollador Flutter Junior + QA | Candidato para Kids&Clouds | josemondelo022@gmail.com | +34 622331827
