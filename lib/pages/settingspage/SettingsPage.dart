import 'package:decentproof/pages/settingspage/uiblocks/DevNetSwitch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox.fromSize(
        size: size,
        child: ListView(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back)),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "settingsPage.title".tr(),
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Divider(),
            ListTile(
              title: Text("settingsPage.devnet".tr()),
              subtitle: Text("settingsPage.description".tr()),
              trailing: const DevNetSwitch(),
            ),
            const Divider(),
            const AboutListTile(
              applicationLegalese: "Copyright 2022, Tjalf Bartel",
            ),
            const Divider()
          ],
        ),
      )),
    );
  }
}
