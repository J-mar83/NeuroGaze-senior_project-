import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/widgets/inputfield.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final double space = 8;
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
                children: [
                  Image.asset(
                    "assets/images/Glossy_Logo.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: space),
                  Text(
                    LocaleKeys.loginScreen_welcome.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: space),
                  Text(
                    LocaleKeys.loginScreen_descriptionlogin.tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: space * 2),
                  InputField(
                    hintText: LocaleKeys.loginScreen_hintemail.tr(),
                    prefix: Icon(Icons.email_outlined),
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => (v == null || !v.contains('@'))
                        ? LocaleKeys.loginScreen_invalidemail.tr()
                        : null,
                  ),
                  SizedBox(height: space),

                  InputField(
                    hintText:LocaleKeys.loginScreen_hintpassword.tr(),
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
                      onPressed: () => setState(() => _hidePass = !_hidePass),
                    ),
                    validator: (v) =>
                        (v == null || v.length < 6) ? LocaleKeys.loginScreen_inavlidpass.tr() : null,
                  ),

                  SizedBox(height: space),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                      },
                      child: Text(LocaleKeys.loginScreen_textforget.tr()),
                    ),
                  ),

                  SizedBox(height: space),
                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                      context.pushNamed(AppRoutes.basicCommandScreen);
                        // if (_formKey.currentState!.validate()) {
                        
                      
                        // }
                      },
                      child:Text(LocaleKeys.loginScreen_buttonlogin.tr()),
                    ),
                  ),
                  SizedBox(height: space * 2),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: space * 2),
                        child: Text(
                          LocaleKeys.loginScreen_or.tr(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: space * 2),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // there function to google
                      },
                      label: Text(LocaleKeys.loginScreen_buttongoogle.tr()),
                        icon: Image.asset(
                        "assets/images/icons8-google-94.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),


                  SizedBox(height: space * 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.loginScreen_askaccount.tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButton(
                        onPressed: () {
                           context.pushNamed(AppRoutes.registerScreen);
                        },
                        child: Text(LocaleKeys.loginScreen_createaccount.tr()),
                      ),
                    ],
                  ),
                ]
                .animate(interval: 80.ms) 
      .fadeIn(duration: 500.ms)
      .slideY(begin: 0.25, end: 0, curve: Curves.easeOutCubic),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
