import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SecretEmbeddingTile extends StatelessWidget {
  const SecretEmbeddingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("settingsPage.embedSecret").tr(),
      subtitle: const Text("settingsPage.embedSecretSubtitle").tr(),
      trailing: Checkbox.adaptive(value: false, onChanged: (v) {}),
    );
  }
}
