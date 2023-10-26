import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../settings/bloc/SettingsBlocEvents.dart';
import '../interfaces/IMetaDataPermissionService.dart';

class SecretEmbeddingTile extends StatelessWidget {
  const SecretEmbeddingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IMetaDataPermissionService metaDataPermissionService =
        GetIt.I.get<IMetaDataPermissionService>();
    return ListTile(
      title: const Text("settingsPage.embedSecret").tr(),
      subtitle: const Text("settingsPage.embedSecretSubtitle").tr(),
      trailing: Checkbox.adaptive(
          value: metaDataPermissionService.shouldEmbedSecret(),
          onChanged: (v) => context
              .read<SettingsBloc>()
              .add(ModifySecretEmbeddingPermission(v ?? false))),
    );
  }
}
