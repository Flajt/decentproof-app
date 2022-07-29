import 'package:flutter/material.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: "Support the developer",
        onPressed: () {},
        icon: const Icon(
          Icons.handshake,
        ));
  }
}
