import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final String message;
  const WarningDialog({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Advertencia',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Icon(Icons.warning_amber_outlined),
        ],
      ),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
      ],
    );
  }
}
