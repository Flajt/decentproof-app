import 'package:flutter/material.dart';

class CheckMarkTile extends StatelessWidget {
  final String title;

  final bool value;

  const CheckMarkTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      children: [
        value ? const Icon(Icons.check) : const Icon(Icons.close),
        Text(title)
      ],
    ));
  }
}
