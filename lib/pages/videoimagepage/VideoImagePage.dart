import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VideoImagePage extends StatefulWidget {
  const VideoImagePage({Key? key}) : super(key: key);

  @override
  _VideoImagePageState createState() => _VideoImagePageState();
}

class _VideoImagePageState extends State<VideoImagePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.height,
        height: size.width,
      )),
    );
  }
}
