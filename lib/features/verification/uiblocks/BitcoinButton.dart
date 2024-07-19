import 'package:decentproof/features/hashing/logic/backend/ShowInExplorer.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocStates.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BitcoinButton extends StatelessWidget {
  const BitcoinButton(
      {super.key, required this.showInExplorer, required this.state});

  final ShowInExplorer showInExplorer;
  final VerifiedState state;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
        style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(10.0)),
            backgroundColor: WidgetStatePropertyAll(Color(0xffF7931A))),
        icon: const Icon(Icons.currency_bitcoin),
        onPressed: () => showInExplorer.show(
            transaction: state.statusModel.bitcoinTransaction!),
        label: const Text("verificationPage.showInExplorer").tr());
  }
}
