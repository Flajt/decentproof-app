import 'package:decentproof/pages/videoimagepage/logic/ImageManger.dart';
import 'package:decentproof/pages/videoimagepage/logic/ImagePickerWrapper.dart';
import 'package:decentproof/pages/videoimagepage/logic/VideoManager.dart';
import 'package:decentproof/pages/videoimagepage/uiblocks/ImageButton.dart';
import 'package:decentproof/pages/videoimagepage/uiblocks/VideoButton.dart';
import 'package:decentproof/shared/ExifWrapper.dart';
import 'package:flutter/material.dart';

class VideoImagePage extends StatefulWidget {
  const VideoImagePage({Key? key}) : super(key: key);

  @override
  _VideoImagePageState createState() => _VideoImagePageState();
}

class _VideoImagePageState extends State<VideoImagePage> {
  final imageManager = ImageManager(
      imagePickerWrapper: ImagePickerWrapper(), exifWrapper: ExifWrapper());
  final VideoManager videoManager =
      VideoManager(ImagePickerWrapper(), ExifWrapper());
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
            children: [
              ImageButton(imageManager: imageManager),
              VideoButton(
                videoManager: videoManager,
              )
            ],
          )),
    ));
  }
}
