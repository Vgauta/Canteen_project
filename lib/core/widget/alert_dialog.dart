import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final VoidCallback onTap;
  const AlertDialogWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Product"),
      content: const Text("Are you sure you want to delete this product?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text("Delete"),
        ),
      ],
    );
    ;
  }
}
