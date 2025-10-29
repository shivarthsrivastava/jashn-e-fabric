import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool centerContent;

  const ResponsiveLayout({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppStyles.horizontalPadding,
    ),
    this.centerContent = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppStyles.maxContentWidth,
          ),
          child: child,
        ),
      ),
    );
  }
}
