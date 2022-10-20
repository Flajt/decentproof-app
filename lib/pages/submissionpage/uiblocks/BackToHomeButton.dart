import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.of(context).popAndPushNamed("/"),
        child: const Text("other.home").tr());
  }
}
