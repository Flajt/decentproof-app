import 'package:decentproof/features/verification/models/VerificationStatusModel.dart';
import 'package:decentproof/features/verification/uiblocks/CheckMarkTile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CheckMarkTable extends StatelessWidget {
  final VerificationStatusModel statusModel;

  const CheckMarkTable({super.key, required this.statusModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CheckMarkTile(
            title: "verificationPage.hashMatching".tr(),
            value: statusModel.matchingHashes),
        CheckMarkTile(
            title: "verificationPage.signatureVerified".tr(),
            value: statusModel.verifiedSignature),
        CheckMarkTile(
            title: "verificationPage.locationStored".tr(),
            value: statusModel.metaDataModel?.location != null)
      ]),
    );
  }
}
