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

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({super.key});

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> with OrientationAware {
  @override
  ScreenOrientation get orientation => ScreenOrientation.portrait;
  bool _hidePass = true;
  bool _hideConfirm = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newpassCtrl = TextEditingController();
  final TextEditingController _confirNewCtrl = TextEditingController();
  @override
  void dispose() {
    _newpassCtrl.dispose();
    _confirNewCtrl.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  [
                        const BackButton(),
                        HeightSpacing(height: 28),

                        Text(
                          LocaleKeys.NewPass_title.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const HeightSpacing(height: 10),

                        Text(
                          LocaleKeys.NewPass_descriptionNew.tr(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const HeightSpacing(height: 35),
                        // Password
                        InputField(
                          hintText: LocaleKeys.NewPass_labelNewPass.tr(),
                          prefix: const Icon(Icons.lock_outline),
                          controller: _newpassCtrl,
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
                        const HeightSpacing(height:15),

                        // Confirm password
                        InputField(
                          hintText: LocaleKeys.NewPass_labelComfirm.tr(),
                          prefix: const Icon(Icons.lock_outline),
                          controller: _confirNewCtrl,
                          obscureText: _hideConfirm,
                          keyboardType: TextInputType.visiblePassword,
                          suffix: IconButton(
                            icon: Icon(
                              _hideConfirm
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                            onPressed: () =>
                                setState(() => _hideConfirm = !_hideConfirm),
                          ),
                          validator: (v) => (v != _newpassCtrl.text)
                              ? LocaleKeys.NewPass_notMatch.tr()
                              : null,
                        ),

                        const HeightSpacing(height: 35),
                        PrimaryButton(
                          onPress: () {
                            // function to save new screen then goroute to otp
                            context.pushNamed(AppRoutes.changedpass);
                          },
                          title: LocaleKeys.NewPass_buttonNew.tr(),
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
