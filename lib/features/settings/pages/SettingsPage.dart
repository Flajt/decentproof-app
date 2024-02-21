import 'package:decentproof/features/metadata/uiblocks/LocationEmbeddingTile.dart';
import 'package:decentproof/features/metadata/uiblocks/SecretEmbeddingTile.dart';
import 'package:decentproof/features/settings/bloc/SettingsBloc.dart';
import 'package:decentproof/features/settings/bloc/SettingsBlocEvents.dart';
import 'package:decentproof/features/settings/uiblocks/AddEmailDialog.dart';
import 'package:decentproof/features/settings/uiblocks/EmailEmbeddingTile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:decentproof/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
              child: Stack(
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
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const EmailEmbeddingTile(),
            const AboutListTile(),
            ListTile(
              title: const Text("FAQ"),
              onTap: () async => await launchUrlString(WIKI_URL),
            ),
            const LocationEmbeddingTile(),
            const SecretEmbeddingTile()
          ],
        ),
      )),
    );
  }
}
