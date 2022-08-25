import 'package:decentproof/pages/homepage/uiblocks/OptionTile.dart';
import 'package:flutter/material.dart';

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({Key? key}) : super(key: key);
  final List<OptionTile> tiles = const [
    OptionTile(
        iconData: Icons.camera,
        title: "Image/Videos",
        navigationRoute: "/videoImagePage"),
    OptionTile(
        iconData: Icons.mic, title: "Sound", navigationRoute: "/audioPage"),
    OptionTile(
        iconData: Icons.check,
        title: "Verify",
        navigationRoute: "/verificationPage")
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      width: size.width * .8,
      height: size.height * .2,
      //decoration: BoxDecoration(border: Border.all()),
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ListView.builder(
              itemCount: tiles.length,
              itemBuilder: (context, index) => tiles[index])),
    );
  }
}
