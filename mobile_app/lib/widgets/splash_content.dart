import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/widgets/heartanimation.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.logoSize,
     required this.space,
  });

  final double logoSize;
  final double space;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Glossy_Logo.png",
            width: logoSize,
            height: logoSize,
          ),
          SizedBox(height: space),
          Text("NeuroGaze", style: textTheme.titleLarge),
          SizedBox(height: space),
          Text(
            LocaleKeys.splashScreen_description_app.tr(),
            style: textTheme.labelMedium,
          ),
          SizedBox(height: space),
          const HeartbeatAnimation(),
          SizedBox(height: space),
          Text(
            LocaleKeys.splashScreen_syncing.tr(),
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}