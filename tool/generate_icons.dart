import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

/// Script para generar íconos placeholder para la app
/// 
/// Ejecuta con: dart run tool/generate_icons.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  print('Generando íconos placeholder...');
  
  // Crear ícono principal (1024x1024)
  await _generateIcon(
    size: 1024,
    outputPath: 'assets/icon/icon.png',
    showBackground: true,
  );
  
  // Crear ícono foreground (432x432)
  await _generateIcon(
    size: 432,
    outputPath: 'assets/icon/icon_foreground.png',
    showBackground: false,
  );
  
  // Crear splash screen (1152x1152)
  await _generateSplash(
    size: 1152,
    outputPath: 'assets/splash/splash.png',
  );
  
  print('¡Íconos generados exitosamente!');
  print('Ahora ejecuta:');
  print('  dart run flutter_launcher_icons');
  print('  dart run flutter_native_splash:create');
}

Future<void> _generateIcon({
  required int size,
  required String outputPath,
  required bool showBackground,
}) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final paint = Paint();
  
  if (showBackground) {
    // Fondo azul
    paint.color = const Color(0xFF1E88E5);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
      paint,
    );
  }
  
  // Dibujar checkmark blanco
  paint.color = Colors.white;
  paint.style = PaintingStyle.stroke;
  paint.strokeWidth = size * 0.08;
  paint.strokeCap = StrokeCap.round;
  
  final path = Path();
  final centerX = size / 2;
  final centerY = size / 2;
  final scale = size / 1024;
  
  // Checkmark
  path.moveTo(centerX - 150 * scale, centerY);
  path.lineTo(centerX - 50 * scale, centerY + 100 * scale);
  path.lineTo(centerX + 150 * scale, centerY - 100 * scale);
  
  canvas.drawPath(path, paint);
  
  // Convertir a imagen
  final picture = recorder.endRecording();
  final img = await picture.toImage(size, size);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final buffer = byteData!.buffer.asUint8List();
  
  // Guardar archivo
  final file = File(outputPath);
  await file.writeAsBytes(buffer);
  
  print('✓ Generado: $outputPath');
}

Future<void> _generateSplash({
  required int size,
  required String outputPath,
}) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final paint = Paint();
  
  // Fondo transparente (el color se maneja en la config)
  
  // Dibujar checkmark blanco más grande
  paint.color = Colors.white;
  paint.style = PaintingStyle.stroke;
  paint.strokeWidth = size * 0.06;
  paint.strokeCap = StrokeCap.round;
  
  final path = Path();
  final centerX = size / 2;
  final centerY = size / 2;
  final scale = size / 1152;
  
  // Checkmark
  path.moveTo(centerX - 200 * scale, centerY);
  path.lineTo(centerX - 50 * scale, centerY + 150 * scale);
  path.lineTo(centerX + 200 * scale, centerY - 150 * scale);
  
  canvas.drawPath(path, paint);
  
  // Convertir a imagen
  final picture = recorder.endRecording();
  final img = await picture.toImage(size, size);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final buffer = byteData!.buffer.asUint8List();
  
  // Guardar archivo
  final file = File(outputPath);
  await file.writeAsBytes(buffer);
  
  print('✓ Generado: $outputPath');
}
