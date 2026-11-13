import 'package:flutter/material.dart';

class HeartbeatAnimation extends StatefulWidget {
  const HeartbeatAnimation({super.key});

  @override
  State<HeartbeatAnimation> createState() => _HeartbeatAnimationState();
}

class _HeartbeatAnimationState extends State<HeartbeatAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return CustomPaint(painter: HeartbeatPainter(controller.value));
        },
      ),
    );
  }
}

class HeartbeatPainter extends CustomPainter {
  final double progress;

  HeartbeatPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    canvas.scale(size.width / 300, size.height / 100);

    final path = Path()
      ..moveTo(0, 50)
      ..lineTo(35, 50)
      ..lineTo(52, 50)
      ..lineTo(72, 15)
      ..lineTo(95, 82)
      ..lineTo(115, 50)
      ..lineTo(155, 50)
      ..lineTo(170, 30)
      ..lineTo(185, 68)
      ..lineTo(205, 50)
      ..lineTo(240, 50)
      ..lineTo(255, 32)
      ..lineTo(270, 65)
      ..lineTo(290, 50);

    final metrics = path.computeMetrics().first;
    final length = metrics.length;

    // الخط الأساسي الخافت
    final basePaint = Paint()
      ..color = Colors.blue.withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, basePaint);

    // الجزء المتحرك من الخط
    final animatedPath = metrics.extractPath(0, length * progress);

    // تأثير الإضاءة Glow
    final glowPaint = Paint()
      ..color = const Color(0xFF35DDFB).withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7);

    canvas.drawPath(animatedPath, glowPaint);

    // الخط المضيء
    final linePaint = Paint()
      ..color = const Color(0xFF42E8FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(animatedPath, linePaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant HeartbeatPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}