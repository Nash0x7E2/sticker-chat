import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key? key,
    required this.smallScreen,
    this.largeScreen,
  }) : super(key: key);
  final WidgetBuilder smallScreen;
  final WidgetBuilder? largeScreen;

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    if (shortestSide <= 768) {
      return smallScreen(context);
    } else if (shortestSide > 768 && largeScreen != null) {
      return largeScreen!(context);
    } else {
      return smallScreen(context);
    }
  }
}
