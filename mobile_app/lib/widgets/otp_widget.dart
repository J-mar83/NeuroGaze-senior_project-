import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/routers/app_routes.dart';
import 'package:mobile_app/themes/otp_themes.dart';
import 'package:mobile_app/themes/style_app.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeOtp extends StatefulWidget {
  const CodeOtp({super.key});

  @override
  State<CodeOtp> createState() => _CodeOtpState();
}

class _CodeOtpState extends State<CodeOtp> {
  late final TextEditingController _pinCodeCtrl;

  @override
  void initState() {
    super.initState();
    _pinCodeCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _pinCodeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otpTheme = Theme.of(context).extension<OtpTheme>()!;

    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: _pinCodeCtrl,
      keyboardType: TextInputType.number,
      enableActiveFill: true,
      animationType: AnimationType.fade,
      cursorColor: otpTheme.selectedColor,
      backgroundColor: Colors.transparent,

      textStyle: StyleApp.largeText.copyWith(
        color: otpTheme.textColor,
        fontWeight: FontWeight.bold,
      ),

      pinTheme: PinTheme(
        fieldHeight: 70.h,
        fieldWidth: 60.w,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12.r),
        borderWidth: 1.5.w,

        selectedColor: otpTheme.selectedColor,
        selectedFillColor: Colors.transparent,

        activeColor: otpTheme.selectedColor,
        activeFillColor: Colors.transparent,

        inactiveColor: otpTheme.borderColor,
        inactiveFillColor: otpTheme.fillColor,

        errorBorderColor: otpTheme.errorColor,
      ),

      onCompleted: (value) {
        context.pushNamed(AppRoutes.newPass);
      },
    );
  }
}
