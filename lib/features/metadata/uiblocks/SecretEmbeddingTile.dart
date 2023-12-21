import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
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
    final IMetaDataPermissionService service =
        GetIt.I.get<IMetaDataPermissionService>();
    return IgnorePointer(
      child: BlocBuilder<SettingsBloc, SettingsBlocStates>(
          builder: (context, snapshot) {
        return ListTile(
          title: const Text("settingsPage.embedSecret").tr(),
          subtitle: const Text("settingsPage.embedSecretSubtitle").tr(),
          trailing: Checkbox.adaptive(
              value: service.shouldEmbedSecret(),
              onChanged: (v) => context
                  .read<SettingsBloc>()
                  .add(ModifySecretEmbeddingPermission(v ?? false))),
        );
      }),
    );
  }
}
