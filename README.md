# Kids & Clouds Agenda

<div align="center">
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
<img src="https://img.shields.io/badge/version-1.0.0-blue" alt="Version 1.0.0"/>
</div>

## 📱 Aplicación de Agenda Digital para Guarderías

Esta aplicación forma parte del proceso de selección para el puesto de desarrollador junior en **Kids & Clouds**. Permite a los padres visualizar la actividad diaria de sus hijos en la guardería a través de una interfaz intuitiva y amigable.

## ✨ Características

### Agenda Diaria
- **Visualización de eventos diarios**: Muestra las actividades realizadas por cada niño durante el día
- **Filtrado por niño**: Permite seleccionar y ver solo las actividades de un niño específico
- **Filtrado por categoría**: Permite filtrar eventos por tipo de actividad (alimentación, siesta, etc.)
- **Filtrado combinado**: Aplicación simultánea de filtros por niño y categoría
- **Paginación**: Visualización de 5 eventos por página con controles de navegación
- **Contador de eventos**: Muestra cuántos eventos cumplen los criterios de filtrado actuales

### Dashboard de Estadísticas
- **Gráfico de categorías**: Visualización de proporción de eventos por categoría
- **Estadísticas por niño**: Conteo de actividades por cada niño
- **Interfaz adaptativa**: Diseño específico para móvil y web (el gráfico muestra leyenda vertical en web)

### Experiencia de Usuario
- **Interfaz responsiva**: Diseño adaptable para diferentes tamaños de pantalla
- **Navegación intuitiva**: Cambio entre agenda y dashboard desde barra inferior
- **Múltiples categorías**: 7 categorías de eventos (alimentación, siesta, actividad, deposiciones, observaciones, medicación y desarrollo)
- **Tema personalizado Kids&Clouds**: Diseño visual coherente con paleta de colores vibrante y moderna

## 🔧 Tecnologías y Herramientas

- **Flutter SDK**: Framework para desarrollo multiplataforma
- **Dart**: Lenguaje de programación
- **Material Design 3**: Guía de diseño para la interfaz de usuario
- **Google Fonts**: Tipografía personalizada (Quicksand)
- **Robohash**: Servicio para generar avatares para niños y padres
- **Arquitectura modular**: Organización del código basada en características (feature-based)

## Estructura del Proyecto

```
lib/
├─ main.dart                  # Punto de entrada de la aplicación
├─ controllers/               # Controladores
│   └─ pagination_controller.dart # Controlador para paginación
├─ models/                    # Definición de modelos de datos
│   ├─ child.dart             # Modelo para los niños
│   └─ event.dart             # Modelo para eventos/actividades
├─ screens/                   # Pantallas de la aplicación
│   ├─ home_screen.dart        # Pantalla principal con navegación
│   ├─ agenda_screen.dart      # Pantalla de agenda diaria
│   └─ dashboard_screen.dart   # Pantalla de dashboard con estadísticas
├─ services/                  # Servicios de datos
│   └─ mock_data_service.dart # Servicio de datos de prueba
├─ theme/                     # Configuración de tema personalizado
│   └─ app_theme.dart         # Definición del tema Kids&Clouds
├─ utils/                     # Utilidades
│   └─ string_extensions.dart # Extensiones para formateo
└─ widgets/                   # Componentes reutilizables
    ├─ agenda/                # Widgets específicos de la agenda
    │   ├─ category_menu.dart         # Menú para filtrar categorías
    │   ├─ child_selector_header.dart # Cabecera con selector de niño
    │   ├─ empty_state.dart           # Mensaje cuando no hay eventos
    │   ├─ event_card.dart            # Tarjeta de evento individual
    │   ├─ pagination_controls.dart   # Controles de paginación
    │   └─ pagination_info_bar.dart   # Barra de info de paginación
    └─ dashboard/             # Widgets del dashboard
        ├─ category_pie_chart.dart    # Gráfico circular de categorías
        ├─ child_stats_list.dart     # Lista de estadísticas por niño
        └─ stat_card.dart           # Tarjeta de estadística individual
```

## Instrucciones de Instalación

### Prerrequisitos

- Flutter SDK (versión recomendada: 3.0.0 o superior)
- Dart SDK
- Editor (VS Code, Android Studio, etc.)

### Pasos para ejecutar

1. Clona el repositorio
```bash
git clone https://github.com/tu-usuario/kids_and_clouds_agenda.git
cd kids_and_clouds_agenda
```

2. Instala las dependencias
```bash
flutter pub get
```

3. Ejecuta la aplicación
```bash
flutter run -d chrome --web-renderer html
```

## 🧪 Pruebas Automáticas

Esta aplicación incluye pruebas unitarias y de widgets para garantizar su correcto funcionamiento. Para ejecutarlas:

```bash
flutter test
```

### Pruebas implementadas:

1. **Tests de lógica (`mock_data_service_test.dart`)**:
   - Verifica que `getFilteredEvents()` retorna todos los eventos cuando no hay filtros aplicados
   - Comprueba que el filtrado por ID de niño funciona correctamente
   - Valida el filtrado por categoría de evento
   - Prueba la combinación de filtros (niño + categoría) simultáneamente
   - Manejo de casos extremos: ninguna coincidencia en los filtros

2. **Tests de widgets (`widget_test.dart`)**:
   - Verifica que `PaginationInfoBar` muestra correctamente la información de paginación
   - Comprueba que el widget se renderiza con los valores correctos de inicio y fin
   - Valida que el contador total de eventos se muestra correctamente

### Capturas de Pantalla

_Se incluirán capturas de pantalla de la aplicación en versión móvil y web_

## 📃 Conclusión

Esta aplicación cumple con todos los requisitos especificados en la prueba técnica para Kids&Clouds, demostrando capacidades de desarrollo en Flutter con atención al detalle, responsividad y buenas prácticas.

Aspectos destacados:
- Interfaz de usuario elegante y funcional
- Filtrado combinado (por niño y categoría)
- Diseño responsive para móvil y web
- Gráfico de estadísticas por categoría
- Pruebas automatizadas

## Autor

José Mondelo Álvarez - Candidato para Flutter Junior + QA en Kids&Clouds
