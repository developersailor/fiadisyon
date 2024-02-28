import 'package:flutter/material.dart';

Widget showErrorMessage(BuildContext context, String message) {
  return AlertDialog(
    title: const Text('Error'),
    content: Text(message),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('OK'),
      ),
    ],
  );
}
