import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LocationEmbeddingTile extends StatelessWidget {
  const LocationEmbeddingTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = GetIt.I.get<IMetaDataPermissionService>();

    return BlocBuilder<SettingsBloc, SettingsBlocStates>(
        builder: (context, state) {
      return ListTile(
        title: const Text("settingsPage.embedLocation").tr(),
        subtitle: const Text("settingsPage.embedLocationSubtitle").tr(),
        trailing: Checkbox.adaptive(
            value: service.shouldEmbedLocation(),
            onChanged: (v) => context
                .read<SettingsBloc>()
                .add(ModifyLocationEmbeddingPermission(v ?? false))),
      );
    });
  }
}
