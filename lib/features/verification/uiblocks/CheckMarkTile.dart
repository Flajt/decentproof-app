import 'package:flutter/material.dart';

class CheckMarkTile extends StatelessWidget {
  final String title;

  final bool value;

  const CheckMarkTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            value
                ? const Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                  )
                : const Icon(
                    Icons.close,
                    color: Colors.redAccent,
                  ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ));
  }
}
