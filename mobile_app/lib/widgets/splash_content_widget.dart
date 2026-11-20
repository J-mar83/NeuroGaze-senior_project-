import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/themes/assets_app.dart';
import 'package:mobile_app/widgets/heart_animation_widget.dart';
import 'package:mobile_app/widgets/spacing_widget.dart';

class SplashContent extends StatelessWidget {
  final double logoSize;
  final double space;

  const SplashContent({
    super.key,
    required this.logoSize,
     required this.space,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsApp.logo,
            width: logoSize,
            height: logoSize,
          ),

           HeigthSpacing(heigth: space),

          Text("NeuroGaze", style: textTheme.titleLarge),
           HeigthSpacing(heigth: space),
          Text(
            LocaleKeys.splashScreen_description_app.tr(),
            style: textTheme.labelMedium,
          ),
           HeigthSpacing(heigth: space),
          const HeartbeatAnimation(),
          HeigthSpacing(heigth: space),
          Text(
            LocaleKeys.splashScreen_syncing.tr(),
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}