import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/assets_app.dart';
import 'package:mobile_app/themes/style_app.dart';
import 'package:mobile_app/widgets/input_field_widget.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/widgets/primary_button_widget.dart';
import 'package:mobile_app/widgets/spacing_widget.dart';
import 'package:mobile_app/models/user_role.dart';
import 'package:mobile_app/utils/orientation_aware.dart';

class Loginscreen extends StatefulWidget {
  final UserRole role; // مين اللي بيسجل دخول: مريض ولا مرافق
  const Loginscreen({super.key, this.role = UserRole.patient});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> with OrientationAware {
  @override
  ScreenOrientation get orientation => ScreenOrientation.portrait;
  bool _hidePass = true;
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: StyleApp.pagePadding,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children:
                    [
                          Image.asset(AssetsApp.logo, width: 100, height: 100),
                          const HeigthSpacing(heigth: 8),
                          Text(
                            LocaleKeys.loginScreen_welcome.tr(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const HeigthSpacing(heigth: 8),
                          Text(
                            widget.role == UserRole.companion
                                ? LocaleKeys.loginScreen_descriptionCompanion.tr()
                                : LocaleKeys.loginScreen_descriptionPatient.tr(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const HeigthSpacing(heigth: 16),
                          // TextField for login
                          InputField(
                            hintText: LocaleKeys.loginScreen_hintemail.tr(),
                            prefix: Icon(Icons.email_outlined),
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) => (v == null || !v.contains('@'))
                                ? LocaleKeys.loginScreen_invalidemail.tr()
                                : null,
                          ),
                          const HeigthSpacing(heigth: 16),

                          InputField(
                            hintText: LocaleKeys.loginScreen_hintpassword.tr(),
                            prefix: const Icon(Icons.lock_outline),
                            controller: _passwordCtrl,
                            obscureText: _hidePass,
                            keyboardType: TextInputType.visiblePassword,
                            suffix: IconButton(
                              icon: Icon(
                                _hidePass
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                              onPressed: () =>
                                  setState(() => _hidePass = !_hidePass),
                            ),
                            validator: (v) => (v == null || v.length < 6)
                                ? LocaleKeys.loginScreen_inavlidpass.tr()
                                : null,
                          ),
                          const HeigthSpacing(heigth: 8),
                          //  button forget pass
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                LocaleKeys.loginScreen_textforget.tr(),
                              ),
                            ),
                          ),
                          // button login
                          const HeigthSpacing(heigth: 8),
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              title: LocaleKeys.loginScreen_buttonlogin.tr(),
                              heigth: 55 ,
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  context.goNamed(
                                    widget.role == UserRole.companion
                                        ? AppRoutes.companionShell
                                        : AppRoutes.basicCommandScreen,
                                  );
                                }
                              },
                            ),
                          ),
                          const HeigthSpacing(heigth: 8),
                          // ask or
                          Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  LocaleKeys.loginScreen_or.tr(),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          const HeigthSpacing(heigth: 16),
                          // login by google
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                // there function to google
                              },
                              label: Text(
                                LocaleKeys.loginScreen_buttongoogle.tr(),
                              ),
                              icon: Image.asset(
                                AssetsApp.google,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                          // create account
                          const HeigthSpacing(heigth: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LocaleKeys.loginScreen_askaccount.tr(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextButton(
                                onPressed: () {
                                  context.pushNamed(
                                    AppRoutes.registerScreen,
                                    extra: widget.role,
                                  );
                                  },
                                child: Text(
                                  LocaleKeys.loginScreen_createaccount.tr(),
                                ),
                              ),
                            ],
                          ),
                        ]
                        .animate(interval: 80.ms)
                        .fadeIn(duration: 500.ms)
                        .slideY(
                          begin: 0.25,
                          end: 0,
                          curve: Curves.easeOutCubic,
                        ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
