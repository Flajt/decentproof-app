import 'package:decentproof/features/settings/bloc/SecureStorageBloc.dart';
import 'package:decentproof/features/settings/bloc/SecureStorageBlocEvents.dart';
import 'package:decentproof/features/settings/bloc/SecureStorageBlocState.dart';
import 'package:decentproof/shared/uiblocks/ErrorDialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmailDialog extends StatelessWidget {
  const AddEmailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Dialog(
        child: SizedBox(
      height: 260,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("settingsPage.addEmail",
                  style: Theme.of(context).textTheme.titleLarge)
              .tr(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                maxLength: 35,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: "someone@somewhere.com",
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                )),
          ),
          BlocListener<SecureStorageBloc, SecureStorageState>(
            listener: (context, state) {
              if (state is EmailSavedState) {
                Navigator.of(context).pop();
              } else if (state is ErrorState) {
                showDialog(
                    context: context,
                    builder: (context) => ErrorDialog(
                        size: const Size(300, 450), error: state.errorMessage));
              }
            },
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<SecureStorageBloc>()
                    .add(SaveEmailEvent(emailController.text));
              },
              child: const Text('other.submit').tr(),
            ),
          ),
        ],
      ),
    ));
  }
}
