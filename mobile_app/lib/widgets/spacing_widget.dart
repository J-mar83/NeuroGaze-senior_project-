import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeigthSpacing extends StatelessWidget {
  final double? heigth;

  const HeigthSpacing({
    super.key,
    this.heigth,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: heigth?.h);
  }
}

class WidthSpacing extends StatelessWidget {
  final double? width;

  const WidthSpacing({
    super.key,
    this.width,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width?.w);
  }
}