import 'package:flutter/material.dart';

import '../uiblocks/ImageButton.dart';
import '../uiblocks/VideoButton.dart';

class VideoImagePage extends StatelessWidget {
  const VideoImagePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ImageButton(), VideoButton()],
          )),
    ));
  }
}
