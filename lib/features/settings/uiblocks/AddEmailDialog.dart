import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          ElevatedButton(
            onPressed: () {
              if (emailController.text.isNotEmpty &&
                  emailController.text.contains(RegExp(
                      r"^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$"))) {}
            },
            child: const Text('other.submit').tr(),
          ),
        ],
      ),
    ));
  }
}
