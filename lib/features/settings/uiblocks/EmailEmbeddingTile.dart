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
    return BlocListener(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
          ));
        } else if (state is EmailDeletedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("👍"),
            duration: Duration(seconds: 3),
          ));
        }
      },
      child: ListTile(
        title: Text("settingsPage.addEmail".tr()),
        subtitle: Text("settingsPage.description".tr()),
        onTap: () => showDialog(
            context: context, builder: (context) => const AddEmailDialog()),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: () => context.read<SettingsBloc>().add(DeleteEmail()),
        ),
      ),
    );
  }
}
