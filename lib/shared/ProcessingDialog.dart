import 'package:flutter/material.dart';

class ProcessingDialog extends StatelessWidget {
  const ProcessingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      elevation: 0.0,
      insetPadding: EdgeInsets.all(1),
      backgroundColor: Colors.transparent,
      child: Center(
          child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
        strokeWidth: 10.0,
        semanticsLabel: "Processing input",
      )),
    );
  }
}
