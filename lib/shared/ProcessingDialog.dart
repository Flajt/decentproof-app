import 'package:flutter/material.dart';

class ProcessingDialog extends StatelessWidget {
  const ProcessingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator.adaptive(
      backgroundColor: Colors.white,
    ));
  }
}
