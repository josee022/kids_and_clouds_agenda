# Kids & Clouds Agenda

<div align="center">
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
<img src="https://img.shields.io/badge/version-1.0.0-blue" alt="Version 1.0.0"/>
</div>

## 📱 Aplicación de Agenda Digital para Guarderías

Esta aplicación forma parte del proceso de selección para el puesto de desarrollador junior en **Kids & Clouds**. Permite a los padres visualizar la actividad diaria de sus hijos en la guardería a través de una interfaz intuitiva y amigable.

## ✨ Características

- **Visualización de eventos diarios**: Muestra las actividades realizadas por cada niño durante el día
- **Filtrado por niño**: Permite seleccionar y ver solo las actividades de un niño específico
- **Filtrado por categoría**: Permite filtrar eventos por tipo de actividad (alimentación, siesta, etc.)
- **Filtrado combinado**: Aplicación simultánea de filtros por niño y categoría
- **Paginación**: Visualización de 5 eventos por página con controles de navegación
- **Interfaz responsiva**: Diseño adaptable para diferentes tamaños de pantalla
- **Contador de eventos**: Muestra cuántos eventos cumplen los criterios de filtrado actuales
- **Múltiples categorías**: 7 categorías de eventos (alimentación, siesta, actividad, deposiciones, observaciones, medicación y desarrollo)

## 🔧 Tecnologías y Herramientas

- **Flutter SDK**: Framework para desarrollo multiplataforma
- **Dart**: Lenguaje de programación
- **Material Design**: Guía de diseño para la interfaz de usuario
- **Robohash**: Servicio para generar avatares para niños y padres
- **Arquitectura modular**: Organización del código basada en características (feature-based)

## 📂 Estructura del Proyecto

```
lib/
├── main.dart                  # Punto de entrada de la aplicación
├── models/                    # Definición de modelos de datos
│   ├── child.dart             # Modelo para los niños
│   └── event.dart             # Modelo para eventos/actividades
├── screens/                   # Pantallas de la aplicación
│   └── agenda_screen.dart     # Pantalla principal de la agenda
├── services/                  # Servicios de datos
│   └── mock_data_service.dart # Servicio de datos de prueba
├── utils/                     # Utilidades
│   └── string_extensions.dart # Extensiones para formateo
└── widgets/                   # Componentes reutilizables
    ├── agenda/                # Widgets específicos de la agenda
    │   ├── category_menu.dart         # Menú para filtrar categorías
    │   ├── child_selector_header.dart # Cabecera con selector de niño
    │   ├── empty_state.dart           # Mensaje cuando no hay eventos
    │   ├── event_card.dart            # Tarjeta de evento individual
    │   ├── pagination_controls.dart   # Controles de paginación
    │   └── pagination_info_bar.dart   # Barra de info de paginación
```

## 🚀 Instrucciones de Instalación

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

## 📋 Funcionalidades implementadas

1. **Interfaz principal**
   - Header con nombre del padre/madre y avatar personalizado
   - Selector de niño (dropdown) con avatares
   - Contador de eventos y rango de visualización
   - Lista de eventos con información detallada

2. **Filtrado multi-criterio**
   - Filtrado por niño (todos o uno específico)
   - Filtrado por categoría (todas o una específica)
   - Visualización de eventos que cumplen ambos criterios
   - Actualización dinámica de la paginación al filtrar

3. **Sistema de paginación**
   - Visualización de 5 eventos por página
   - Controles para navegar entre páginas (anterior/siguiente)
   - Indicador visual del rango de eventos mostrados
   - Manejo de casos extremos (sin eventos, última página)

4. **Datos de prueba ampliados**
   - 6 niños con diferentes edades
   - 25 eventos distribuidos entre los niños
   - 7 categorías de eventos con iconos específicos
   - Eventos ordenados cronológicamente

5. **Mejoras visuales**
   - Tarjetas con información completa de cada evento
   - Íconos específicos por categoría de evento
   - Mensajes informativos cuando no hay eventos
   - Estilos visuales modernos (sombras, bordes redondeados)
   - Avatar del padre/madre en el encabezado

6. **Estructura modular**
   - Organización basada en características
   - Componentes reutilizables independientes
   - Separación clara entre lógica y presentación
   - Código limpio y mantenible

7. **Optimizaciones para web**
   - Carga de imágenes compatible con CORS (mediante robohash.org)
   - Renderizado HTML optimizado

## 🔜 Próximas mejoras

- Implementar tema personalizado con colores de Kids&Clouds
- Mejorar el diseño visual de las tarjetas por categoría
- Implementar filtrado avanzado por fecha o texto
- Añadir dashboard estadístico con gráficos
- Mejorar la responsividad para diferentes tamaños de pantalla
- Añadir página de detalles para cada niño
- Incorporar animaciones y transiciones suaves
- Implementar pruebas unitarias y de widget
- Mejoras visuales siguiendo la estética de Kids & Clouds
- Dashboard estadístico
- Vista detallada de perfiles

## 📈 Capturas de pantalla

[Pendiente de añadir capturas de pantalla de la aplicación]

## 👨‍💻 Desarrollador

Creado como parte de la prueba técnica para Kids & Clouds.
