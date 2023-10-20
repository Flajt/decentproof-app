import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:decentproof/features/verification/uiblocks/CheckMarkTile.dart';
import 'package:flutter/material.dart';

class CheckMarkTable extends StatelessWidget {
  final VerificationStatusModel statusModel;

  const CheckMarkTable({super.key, required this.statusModel});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth * .4,
        height: constraints.maxHeight * .5,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: ListView(children: [
          CheckMarkTile(
              title: "Hashes Matching?", value: statusModel.matchingHashes),
          const Divider(color: Colors.grey),
          CheckMarkTile(
              title: "Signature Verified?",
              value: statusModel.verifiedSignature),
        ]),
      );
    });
  }
}
