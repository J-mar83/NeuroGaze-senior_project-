import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/spacing_widget.dart';

class CardCommand extends StatelessWidget {
  final String title;
  final String iconCommand;
  final double iconSize;
  final VoidCallback onTap;

  const CardCommand({
    super.key,
    required this.title,
    required this.iconCommand,
    required this.iconSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
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
        ),
      ),
    );
  }
}