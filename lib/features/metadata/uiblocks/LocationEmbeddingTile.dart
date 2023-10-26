import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocationEmbeddingWidget extends StatelessWidget {
  const LocationEmbeddingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("settingsPage.embedLocation").tr(),
      subtitle: const Text("settingsPage.embedLocationSubtitle").tr(),
      trailing: Checkbox.adaptive(value: false, onChanged: (v) {}),
    );
  }
}
