import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Clase que contiene toda la configuración de tema personalizada para Kids&Clouds
class AppTheme {
  // Colores primarios
  static const Color primaryBlue = Color(0xFF1E88E5);     // Azul Kids&Clouds
  static const Color primaryPurple = Color(0xFF7E57C2);   // Morado suave
  static const Color primaryTeal = Color(0xFF26A69A);     // Verde azulado
  
  // Colores secundarios
  static const Color accentYellow = Color(0xFFFFD54F);    // Amarillo cálido
  static const Color accentCoral = Color(0xFFFF7043);     // Coral/naranja
  static const Color accentPink = Color(0xFFF06292);      // Rosa suave
  
  // Colores neutros
  static const Color backgroundLight = Color(0xFFF5F5F5); // Fondo claro
  static const Color cardBackground = Colors.white;       // Fondo de tarjetas
  static const Color textPrimary = Color(0xFF424242);     // Texto principal
  static const Color textSecondary = Color(0xFF757575);   // Texto secundario

  // Colores para categorías específicas
  static const Map<String, Color> categoryColors = {
    'food': Color(0xFFFF9800),          // Naranja para alimentación
    'nap': Color(0xFF673AB7),           // Morado para siestas
    'activity': Color(0xFF4CAF50),      // Verde para actividades
    'bathroom': Color(0xFF2196F3),      // Azul para baño
    'observation': Color(0xFF9E9E9E),   // Gris para observaciones
    'medication': Color(0xFFE91E63),    // Rosa para medicación
    'development': Color(0xFF00BCD4),   // Turquesa para desarrollo
  };

  /// Método para obtener el tema completo de la aplicación
  static ThemeData getTheme() {
    return ThemeData(
      // Esquema de colores principal
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: primaryPurple,
        tertiary: primaryTeal,
        background: backgroundLight,
        surface: cardBackground,
        error: accentCoral,
        brightness: Brightness.light,
      ),
      
      // Configuración de fuentes
      textTheme: GoogleFonts.quicksandTextTheme(
        const TextTheme(
          // Títulos
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          // Cuerpo de texto
          bodyLarge: TextStyle(
            fontSize: 16, 
            color: textPrimary,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: textPrimary,
          ),
          // Textos más pequeños
          bodySmall: TextStyle(
            fontSize: 12,
            color: textSecondary,
          ),
        ),
      ),
      
      // Personalización de AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      
      // Nota: El estilo de tarjetas se aplicará directamente en los widgets
      // para evitar problemas de compatibilidad con diferentes versiones de Flutter
      
      // Personalización de botones elevados
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      
      // Personalización de botones de texto
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryPurple,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      
      // Personalización de chips de filtro
      chipTheme: ChipThemeData(
        backgroundColor: primaryBlue.withOpacity(0.1),
        selectedColor: primaryBlue,
        labelStyle: const TextStyle(color: textPrimary),
        secondaryLabelStyle: const TextStyle(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: primaryBlue.withOpacity(0.3)),
        ),
      ),
      
      // Personalización de divider
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE0E0E0),
        thickness: 1,
        indent: 16,
        endIndent: 16,
      ),
      
      // Habilitar Material 3
      useMaterial3: true,
    );
  }
  
  /// Método para obtener el color asociado a una categoría
  static Color getCategoryColor(String category) {
    return categoryColors[category] ?? accentCoral;
  }
}
