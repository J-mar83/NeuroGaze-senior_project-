import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/widgets/inputfield.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final double space = 8.0;
  bool _hidePass = true;
  final bool _hideConfirm = true;
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController(); 
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController(); 

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.08,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children:
                    [
                          Image.asset(
                            "assets/images/Glossy_Logo.png",
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: space),
                          Text(
                            LocaleKeys.registerScreen_createaccount.tr(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: space),
                          Text(
                            LocaleKeys.registerScreen_descriptionregister.tr(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(height: space * 2),
                          InputField(
                            hintText: LocaleKeys.registerScreen_name.tr(),
                            prefix: Icon(Icons.person_2_outlined),
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: space),

                          InputField(
                            hintText: LocaleKeys.registerScreen_hintemail.tr(),
                            prefix: Icon(Icons.email_outlined),
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) => (v == null || !v.contains('@'))
                                ? LocaleKeys.registerScreen_invalidemail.tr()
                                : null,
                          ),
                          SizedBox(height: space),

                          InputField(
                            hintText: LocaleKeys.registerScreen_hintpassword
                                .tr(),
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
                                ? LocaleKeys.registerScreen_inavlidpass.tr()
                                : null,
                          ),

                          SizedBox(height: space),

                          InputField(
                            hintText: LocaleKeys.registerScreen_hintconfirmpass
                                .tr(),
                            prefix: const Icon(Icons.lock_outline),
                            controller: _confirmCtrl,
                            obscureText: _hideConfirm,
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
                                ? LocaleKeys.registerScreen_inavlidpass.tr()
                                : null,
                          ),
                          SizedBox(height: space),
                          InputField(
                            hintText: LocaleKeys.registerScreen_hintemergency
                                .tr(),
                            prefix: Icon(Icons.phone),
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,
                            validator: (v) {
                              final phone = v?.trim() ?? '';
                              final ok = RegExp(
                                r'^(\+20|0020|20|0)?1[0125]\d{8}$',
                              ).hasMatch(phone);
                              return ok
                                  ? null
                                  : LocaleKeys.registerScreen_invalidnum.tr();
                            },
                          ),

                          SizedBox(height: space * 5),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  //  routers to homepage
                                }
                              },
                              child: Text(
                                LocaleKeys.registerScreen_createaccount.tr(),
                              ),
                            ),
                          ),

                          SizedBox(height: space * 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LocaleKeys.registerScreen_askaccount.tr(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextButton(
                                onPressed: () {
                                  context.goNamed(AppRoutes.loginScreen);
                                },
                                child: Text(
                                  LocaleKeys.registerScreen_signin.tr(),
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
