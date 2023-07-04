import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Provider para el tema actual
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Provider para el color actual
final currentColorProvider = StateProvider((ref) => 0);