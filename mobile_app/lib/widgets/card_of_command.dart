import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/gaze_button.dart';
import 'package:mobile_app/widgets/spacing_widget.dart';

class CardCommand extends StatelessWidget {
  final String title;
  final String iconCommand;
  final double iconSize;
  final VoidCallback onTap;

  // true = يتفعّل بالتثبيت (شاشات المريض)
  // false = ضغطة عادية (اختيار الدور والـ Login، لأن المرافق هو اللي بيعملها)
  final bool gaze;

  const CardCommand({
    super.key,
    required this.title,
    required this.iconCommand,
    required this.iconSize,
    required this.onTap,
    this.gaze = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Image.asset(
            iconCommand,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
        ),
        const HeigthSpacing(heigth: 15),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
      ],
    );

    if (gaze) {
      return GazeButton(onActivated: onTap, child: content);
    }

    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: InkWell(onTap: onTap, child: content),
    );
  }
}