import 'package:decentproof/pages/homepage/uiblocks/SupportDialog.dart';
import 'package:flutter/material.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: "Support the developer",
        onPressed: () => showDialog(
            context: context, builder: (context) => const SupportDialog()),
        icon: const Icon(
          Icons.handshake,
        ));
  }
}
