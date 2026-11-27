import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/generated/locale_keys.g.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/style_app.dart';
import 'package:mobile_app/utils/orientation_aware.dart';
import 'package:mobile_app/widgets/otp_widget.dart';
import 'package:mobile_app/widgets/primary_button_widget.dart';
import 'package:mobile_app/widgets/spacing_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with OrientationAware {
  @override
  ScreenOrientation get orientation => ScreenOrientation.portrait;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: StyleApp.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                HeightSpacing(height: 28),

                Text(
                  LocaleKeys.otp_title.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                const HeightSpacing(height: 10),

                Text(
                  LocaleKeys.otp_descriptionOtp.tr(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),

                const HeightSpacing(height: 40),

                const CodeOtp(),

                const HeightSpacing(height: 20),

                PrimaryButton(
                  onPress: () {
                    // Verify OTP
                  },
                  title: LocaleKeys.otp_buttonOtp.tr(),
                  heigth: 45,
                ),

                Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.otp_askCode.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        // Resend OTP
                        context.pushNamed(AppRoutes.newPass);
                      },
                      child: Text(LocaleKeys.otp_resend.tr()),
                    ),
                  ],
                ),

                const HeightSpacing(height: 26),
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
    );
  }
}