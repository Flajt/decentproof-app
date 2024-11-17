import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SentrySettingsTile extends StatelessWidget {
  const SentrySettingsTile({super.key});
  @override
  Widget build(BuildContext context) {
    bool chachedValue = false;
    return BlocSelector<SettingsBloc, SettingsBlocStates, bool>(
        selector: (state) {
      print(state);
      if (state is UpdatedSettingsState) {
        chachedValue = state.errorReportingPermission;
        return state.errorReportingPermission;
      } else {
        return chachedValue;
      }
    }, builder: (context, value) {
      return CheckboxListTile(
        value: value,
        onChanged: (v) {
          v = v ?? false;
          context.read<SettingsBloc>().add(ModifyErrorReportingPermission(v));
        },
        title: const Text("settingsPage.errorReportingTitle").tr(),
        subtitle: const Text("settingsPage.errorReportingSubtitle").tr(),
      );
    });
  }
}
