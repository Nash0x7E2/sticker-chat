import 'package:flutter/material.dart';

/// Helper function which wraps the [child] in a `MaterialApp`. This is necessary
/// since widgets require basic layout information such as the default text direction
/// among other things.
///
/// Wrapping in a [MaterialApp] provides this information to the subtree.
Widget makeWidgetTestable(Widget child) {
  return MaterialApp(
    home: child,
  );
}
