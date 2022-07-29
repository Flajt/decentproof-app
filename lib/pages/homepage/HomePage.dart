import 'package:decentproof/pages/homepage/uiblocks/OptionsMenu.dart';
import 'package:decentproof/pages/homepage/uiblocks/SettingsButton.dart';
import 'package:decentproof/pages/homepage/uiblocks/SupportButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(children: const [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SettingsButton(),
              )),
          Align(alignment: Alignment.center, child: OptionsMenu()),
          Align(
              alignment: Alignment.topRight,
              child:
                  Padding(padding: EdgeInsets.all(8.0), child: SupportButton()))
        ]),
      )),
    );
  }
}
