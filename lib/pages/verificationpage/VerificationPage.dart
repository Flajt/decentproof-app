import 'package:decentproof/pages/verificationpage/logic/VerificationLogic.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VerificationLogic verificationLogic = VerificationLogic();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox.fromSize(
              size: size,
              child: Stack(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text("Select File")),
                )
              ]))),
    );
  }
}
