import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocStates.dart';
import 'package:decentproof/features/settings/uiblocks/AddEmailDialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailEmbeddingTile extends StatelessWidget {
  const EmailEmbeddingTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsBlocStates>(
      builder: (context, state) {
        return ListTile(
          title: Text("settingsPage.addEmail".tr()),
          subtitle: Text("settingsPage.description".tr()),
          onTap: () => showDialog(
              context: context, builder: (context) => const AddEmailDialog()),
          trailing: IconButton(
            icon: state is EmailDeletedState
                ? const Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                  )
                : const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () => context.read<SettingsBloc>().add(DeleteEmail()),
          ),
        );
      },
    );
  }
}
