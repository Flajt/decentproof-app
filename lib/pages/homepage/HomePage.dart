import 'package:decentproof/pages/homepage/uiblocks/OptionsMenu.dart';
import 'package:decentproof/pages/homepage/uiblocks/SettingsButton.dart';
import 'package:decentproof/pages/homepage/uiblocks/SupportButton.dart';
import 'package:flutter/material.dart';

import '../Integrety/ApiKeyManager.dart';
import '../Integrety/AppCheckWrapper.dart';
import '../Integrety/SecureStorageWrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ApiKeyManager apiKeyManager =
        ApiKeyManager(SecureStorageWrapper(), AppcheckWrapper());
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SettingsButton(),
              )),
          Align(
              alignment: Alignment.center,
              child: FutureBuilder(
                future: apiKeyManager.updateOrRetriveKey(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasError == false &&
                      snapshot.connectionState == ConnectionState.done) {
                    return const OptionsMenu();
                  }
                  return const Center(
                      child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white, strokeWidth: 10));
                },
              )),
          const Align(
              alignment: Alignment.topRight,
              child:
                  Padding(padding: EdgeInsets.all(8.0), child: SupportButton()))
        ]),
      )),
    );
  }
}
