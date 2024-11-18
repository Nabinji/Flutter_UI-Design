import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  final Widget? smallMobile;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.smallMobile,
  });
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 767;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024 &&
      MediaQuery.of(context).size.width >= 768;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1025;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 1025) {
      return desktop;
    } else if (size.width >= 768 && tablet != null) {
      return tablet!;
    } else if (size.width >= 320 && size.width <= 767) {
      return mobile;
    } else {
      return smallMobile!;
    }
  }
}
