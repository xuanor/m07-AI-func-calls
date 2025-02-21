import 'package:flutter/material.dart';

abstract class Drawable {
  void draw(Canvas canvas);
}

Color _parseColor(String colorHex) {
  colorHex = colorHex.replaceAll('#', '');
  if (colorHex.length == 6) {
    return Color(int.parse('0xFF$colorHex'));
  } else {
    return Colors.black;
  }
}


Gradient? _parseGradient(Map<String, String>? gradientData, Rect rect) {
  if (gradientData == null) return null;
  
  Color startColor = _parseColor(gradientData['startColor'] ?? "#FFFFFF");
  Color endColor = _parseColor(gradientData['endColor'] ?? "#000000");
  
  return LinearGradient(
    colors: [startColor, endColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class Circle extends Drawable {
  final Offset center;
  final double radius;
  final Color borderColor;
  final double borderWidth;
  final Color fillColor;

  Circle({
    required this.center,
    required this.radius,
    String borderColor = '#000000',
    this.borderWidth = 1.0,
    String fillColor = '#FFFFFF',
  })  : borderColor = _parseColor(borderColor),
        fillColor = _parseColor(fillColor);

  @override
  void draw(Canvas canvas) {
    final paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, paint);

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, borderPaint);
  }
}

class Line extends Drawable {
  final Offset start;
  final Offset end;
  final Color color;
  final double thickness;

  Line({
    required this.start,
    required this.end,
    String color = '#000000',
    this.thickness = 1.0,
  }) : color = _parseColor(color);

  @override
  void draw(Canvas canvas) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness;
    canvas.drawLine(start, end, paint);
  }
}


class Rectangle extends Drawable {
  final Offset topLeft;
  final Offset bottomRight;
  final Color borderColor;
  final double borderWidth;
  final Color fillColor;
  final Gradient? gradient;

  Rectangle({
    required this.topLeft,
    required this.bottomRight,
    String borderColor = '#000000',
    this.borderWidth = 1.0,
    String fillColor = '#FFFFFF',
    Map<String, String>? gradientData,
  })  : borderColor = _parseColor(borderColor),
        fillColor = _parseColor(fillColor),
        gradient = _parseGradient(gradientData, Rect.fromPoints(topLeft, bottomRight));

  @override
  void draw(Canvas canvas) {
    final rect = Rect.fromPoints(topLeft, bottomRight);
    final paint = Paint()
      ..style = PaintingStyle.fill;
    
    if (gradient != null) {
      paint.shader = gradient!.createShader(rect);
    } else {
      paint.color = fillColor;
    }
    
    canvas.drawRect(rect, paint);

    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    canvas.drawRect(rect, borderPaint);
  }
}



class TextDrawable extends Drawable {
  final Offset position;
  final String text;
  final double fontSize;
  final String fontFamily;
  final String fontWeight;
  final Color color;

  TextDrawable({
    required this.position,
    required this.text,
    this.fontSize = 16.0,
    this.fontFamily = 'Arial',
    this.fontWeight = 'normal',
    String color = '#000000',
  }) : color = _parseColor(color);

  @override
  void draw(Canvas canvas) {
    final textStyle = TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight == 'bold' ? FontWeight.bold : FontWeight.normal,
      color: color,
    );
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, position);
  }
}
