import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLottieIcon extends StatelessWidget {
  final double width;
  final String assetPath;

  const AppLottieIcon({
    super.key,
    required this.width,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.topLeft,
        child: Lottie.asset(assetPath),
      ),
    );
  }
}
