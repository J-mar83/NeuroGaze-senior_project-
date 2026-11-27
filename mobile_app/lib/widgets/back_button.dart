 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/themes/style_app.dart';


class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
       style: StyleApp.button,
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      onPressed: () => context.pop(),
    );
  }
}