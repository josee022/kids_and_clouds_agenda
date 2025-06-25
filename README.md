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
- **Interfaz responsiva**: Diseño adaptable para diferentes tamaños de pantalla
- **Contador de eventos**: Muestra cuántos eventos cumplen los criterios de filtrado actuales

## 🔧 Tecnologías y Herramientas

- **Flutter SDK**: Framework para desarrollo multiplataforma
- **Dart**: Lenguaje de programación
- **Material Design**: Guía de diseño para la interfaz de usuario
- **Robohash**: Servicio para generar avatares para los niños

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
    └── category_menu.dart     # Menú para filtrar por categorías
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
   - Header con nombre del padre/madre
   - Selector de niño (dropdown)
   - Contador de eventos
   - Lista de eventos con información detallada

2. **Filtrado multi-criterio**
   - Filtrado por niño (todos o uno específico)
   - Filtrado por categoría (todas o una específica)
   - Visualización de eventos que cumplen ambos criterios

3. **Mejoras visuales**
   - Tarjetas con información completa de cada evento
   - Íconos por categoría de evento
   - Mensajes informativos cuando no hay eventos
   - Estilos visuales modernos (sombras, bordes redondeados)

4. **Optimizaciones para web**
   - Carga de imágenes compatible con CORS (mediante robohash.org)
   - Renderizado HTML optimizado

## 🔜 Próximas mejoras

- Paginación de eventos (5 eventos por página)
- Más niños y eventos de ejemplo
- Nuevas categorías de eventos
- Mejoras visuales siguiendo la estética de Kids & Clouds
- Dashboard estadístico
- Vista detallada de perfiles

## 📈 Capturas de pantalla

[Pendiente de añadir capturas de pantalla de la aplicación]

## 👨‍💻 Desarrollador

Creado como parte de la prueba técnica para Kids & Clouds.
