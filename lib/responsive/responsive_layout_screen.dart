import 'package:boostme/providers/user_provider.dart';
import 'package:boostme/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScrrenLayout;
  final Widget mobilecrrenLayout;
  const ResponsiveLayout({
    super.key,
    required this.webScrrenLayout,
    required this.mobilecrrenLayout,
  });

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constaints) {
        if (constaints.maxWidth > webScreenSize) {
          return widget.webScrrenLayout;
        }
        return widget.mobilecrrenLayout;
      },
    );
  }
}
