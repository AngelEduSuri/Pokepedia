import 'package:flutter/material.dart';

class PokepediaCover extends StatelessWidget {
  final bool isTopCover;

  const PokepediaCover({super.key, this.isTopCover = true});

  @override
  Widget build(BuildContext context) {
    final borderRadius = isTopCover
        ? const BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )
        : const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          );

    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade800,
        borderRadius: borderRadius,
      ),
      child: CustomPaint(
        painter: SemiCirclePainter(topPosition: isTopCover),
        child: Container(),
      ),
    );
  }
}

class SemiCirclePainter extends CustomPainter {
  final bool topPosition;

  SemiCirclePainter({super.repaint, required this.topPosition});

  @override
  void paint(Canvas canvas, Size size) {
    final startAngle = topPosition ? 3.14159 : 0.0;
    final offsetY = topPosition ? size.height : 0.0;

    final paint = Paint()
      ..color = const Color(0xff202428)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50.0;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, offsetY),
        width: size.width / 1.5,
        height: size.height / 1.6,
      ),
      startAngle,
      3.14159,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
