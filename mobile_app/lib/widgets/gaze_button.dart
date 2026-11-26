import 'package:flutter/material.dart';
import 'package:mobile_app/themes/colors_app.dart';

/// زرار بيتفعّل بالنظر. دلوقتي بنحاكيه بالضغط المستمر بالإصبع.
class GazeButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onActivated; // بيتنفذ لما العدّاد يكتمل
  final Duration dwell; // مدة التثبيت المطلوبة
  final Color? color; // لون الخلفية (مثلاً أحمر للطوارئ)
  final Color progressColor; // لون التعبئة

  const GazeButton({
    super.key,
    required this.child,
    required this.onActivated,
    this.dwell = const Duration(seconds: 2),
    this.color,
    this.progressColor = AppColors.primaryColor,
  });

  @override
  State<GazeButton> createState() => _GazeButtonState();
}

class _GazeButtonState extends State<GazeButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.dwell)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset(); // الأول نصفّر، لأن onActivated ممكن يقفل الشاشة
          widget.onActivated();
        }
      });
  }

  @override
  void didUpdateWidget(GazeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dwell != widget.dwell) {
      _controller.duration = widget.dwell;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (_) => _controller.forward(), // بدأ التثبيت
      onPointerUp: (_) => _controller.reset(), // سابه قبل ما يكتمل
      onPointerCancel: (_) => _controller.reset(),
      child: Card(
        elevation: 8,
        color: widget.color,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(child: widget.child),
            // التعبئة اللي بتطلع من تحت
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) => Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: _controller.value,
                      child: ColoredBox(
                        color: widget.progressColor.withValues(alpha: 0.35),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}