import 'package:decentproof/features/hashing/logic/backend/ShowInExplorer.dart';
import 'package:decentproof/features/verification/bloc/VerificationBlocStates.dart';
import 'package:decentproof/shared/customIcons/decent_proof_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EthereumButton extends StatelessWidget {
  const EthereumButton(
      {super.key, required this.showInExplorer, required this.state});

  final ShowInExplorer showInExplorer;
  final VerifiedState state;
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
        style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(10.0)),
            backgroundColor: WidgetStatePropertyAll(Color(0xff343434))),
        icon: const Icon(DecentProof.etherium, color: Colors.white),
        onPressed: () => showInExplorer.show(
            transaction: state.statusModel.ethereumTransaction!,
            network: Network.etherium),
        label: const Text("verificationPage.showInExplorer",
                style: TextStyle(color: Colors.white))
            .tr());
  }
}
