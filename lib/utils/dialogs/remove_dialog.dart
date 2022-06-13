import 'package:flutter/material.dart';

Future<bool?> showRemoveDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("YES"),
    onPressed: () => Navigator.pop(context, true),
  );

  Widget noButton = TextButton(
    child: const Text("NO"),
    onPressed: () => Navigator.pop(context, false),
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Are you sure?"),
    content: const Text("Do you really want to delete?"),
    actions: [
      noButton,
      okButton,
    ],
  );
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
