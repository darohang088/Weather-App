import 'package:flutter/material.dart';

class AppSafeArea extends StatelessWidget {
  const AppSafeArea({
    super.key,
    required this.child,
    this.topColor,
    this.bottomColor,
    this.padding = const EdgeInsets.all(0),
  });

  final Widget child;
  final Color? topColor;
  final Color? bottomColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final double systemNavHeight = MediaQuery.of(context).padding.bottom;
    final double systemStatusBarHeight = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        Container(
          color: topColor ?? Colors.transparent,
          height: systemStatusBarHeight,
        ),
        Expanded(
          child: Padding(padding: padding, child: child),
        ),
        Container(color: bottomColor, height: systemNavHeight),
      ],
    );
  }
}
