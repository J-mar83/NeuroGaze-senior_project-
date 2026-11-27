import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/style_app.dart';
import 'package:mobile_app/utils/orientation_aware.dart';
import 'package:mobile_app/widgets/input_field_widget.dart';
import 'package:mobile_app/widgets/primary_button_widget.dart';
import 'package:mobile_app/widgets/spacing_widget.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> with OrientationAware {
  @override
  ScreenOrientation get orientation => ScreenOrientation.portrait;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController();
  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: StyleApp.pagePadding,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  [
                        const BackButton(),
                        HeightSpacing(height: 28),

                        Text(
                          LocaleKeys.forgetPass_title.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const HeightSpacing(height: 10),

                        Text(
                          LocaleKeys.forgetPass_descriptionForget.tr(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),

                        // enter email
                        const HeightSpacing(height: 32),
                        InputField(
                          hintText: LocaleKeys.forgetPass_labelForget.tr(),
                          prefix: Icon(Icons.email_outlined),
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) => (v == null || !v.contains('@'))
                              ? LocaleKeys.loginScreen_invalidemail.tr()
                              : null,
                        ),

                        const HeightSpacing(height: 38),
                        PrimaryButton(
                          onPress: () { 
                             if (_formKey.currentState!.validate()) {
                            context.pushNamed(AppRoutes.otpScreen);
                            }
                            },
                          title: LocaleKeys.forgetPass_buttonForget.tr(),
                          heigth: 45,
                        ),
                      ]
                      .animate(interval: 80.ms)
                      .fadeIn(duration: 500.ms)
                      .slideY(begin: 0.25, end: 0, curve: Curves.easeOutCubic),
            ),
          ),
        ),
      ),
    );
  }
}
