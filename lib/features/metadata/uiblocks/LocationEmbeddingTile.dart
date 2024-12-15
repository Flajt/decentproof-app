import 'package:decentproof/features/metadata/interfaces/IMetaDataPermissionService.dart';
import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationEmbeddingTile extends StatelessWidget {
  const LocationEmbeddingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsBlocStates>(
        builder: (context, state) {
      return ListTile(
        title: const Text("settingsPage.embedLocation").tr(),
        subtitle: const Text("settingsPage.embedLocationSubtitle").tr(),
        trailing: Checkbox.adaptive(
            value: state is UpdatedSettingsState &&
                state.locationEmbeddingPermission,
            onChanged: (v) => context
                .read<SettingsBloc>()
                .add(ModifyLocationEmbeddingPermission(v ?? false))),
      );
    });
  }
}
