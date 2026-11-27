 import 'package:easy_localization/easy_localization.dart' ;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/assets_app.dart';
import 'package:mobile_app/themes/style_app.dart';
import 'package:mobile_app/widgets/primary_button_widget.dart';
import 'package:mobile_app/widgets/spacing_widget.dart';

class PassSuccess extends StatelessWidget {

  const PassSuccess({
    super.key,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Padding(
          padding: StyleApp.pagePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AssetsApp.success, width: 100, height: 100),
            const HeightSpacing(height: 30),

            Text(LocaleKeys.passSuccess_change.tr(),
            style:Theme.of(context).textTheme.titleLarge),
             const HeightSpacing(height: 20),

              Text(LocaleKeys.passSuccess_DescriptionChange.tr(),
            style:Theme.of(context).textTheme.labelMedium),
             const HeightSpacing(height: 40),

             PrimaryButton(
              onPress:() => context.pushNamed(AppRoutes.loginScreen),
              title: LocaleKeys.passSuccess_button.tr(),
              heigth:45,
             ),
          ],
        ),
      ),
      )
    );
  }
}