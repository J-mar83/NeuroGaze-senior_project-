import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final double? heigth;
  final void Function()? onPress;

  const PrimaryButton({
    super.key,
     this.title,
    this.heigth,
    this.onPress,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, 
    style: ElevatedButton.styleFrom(
      fixedSize: Size(double.infinity, heigth ?? 50.h),
    ),
    child: Text(title ?? "No Text"), );
  }
}