import 'package:boostme/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScrrenLayout;
  final Widget mobilecrrenLayout;
  const ResponsiveLayout({
    super.key,
    required this.webScrrenLayout,
    required this.mobilecrrenLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constaints) {
        if (constaints.maxWidth > webScreenSize) {
          return webScrrenLayout;
        }
        return mobilecrrenLayout;
      },
    );
  }
}
