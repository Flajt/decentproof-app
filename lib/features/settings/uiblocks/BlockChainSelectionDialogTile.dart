import 'package:decentproof/features/hashing/uiblocks/BlockChainSelectionDialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BlockChainSelectionTile extends StatelessWidget {
  const BlockChainSelectionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("settingsPage.blockChainSelection").tr(),
      subtitle: const Text("settingsPage.blockChainSelectionSubtitle").tr(),
      onTap: () => showDialog(
          context: context,
          builder: (context) => const BlockChainSelectionDialog()),
    );
  }
}
