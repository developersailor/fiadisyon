import 'package:flutter/material.dart';

/// A base class for dialogs.
class DialogBase {
  DialogBase._();

  /// Shows a dialog and returns a future that completes with the value
  /// returned by the dialog.
  ///
  /// The [context] parameter is the build context of the widget that
  /// is calling the method.
  ///
  /// The [builder] parameter is a callback that takes a [BuildContext]
  /// and returns a widget tree that will be displayed as the content of
  /// the dialog.
  ///
  /// The method returns a [Future] that completes with the value returned
  /// by the dialog. The type of the value is specified by the generic type
  /// parameter [T].
  ///
  /// Example usage:
  /// ```dart
  /// DialogBase.show<String>(
  ///   context: context,
  ///   builder: (BuildContext context) {
  ///     return AlertDialog(
  ///       title: Text('Dialog Title'),
  ///       content: Text('Dialog Content'),
  ///       actions: [
  ///         TextButton(
  ///           onPressed: () {
  ///             Navigator.of(context).pop('Button 1');
  ///           },
  ///           child: Text('Button 1'),
  ///         ),
  ///         TextButton(
  ///           onPressed: () {
  ///             Navigator.of(context).pop('Button 2');
  ///           },
  ///           child: Text('Button 2'),
  ///         ),
  ///       ],
  ///     );
  ///   },
  /// );
  /// ```
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showDialog<T>(
      context: context,
      builder: builder,
      useSafeArea: false,
      barrierDismissible: false,
    );
  }
}
