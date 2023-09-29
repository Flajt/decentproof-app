import 'package:decentproof/features/hashing/logic/ImagePickerWrapper.dart';
import 'package:decentproof/features/hashing/logic/hasher/VideoImageHashManager.dart';
import 'package:decentproof/shared/ExifWrapper.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:flutter/material.dart';

import '../logic/ImageManger.dart';
import '../logic/VideoManager.dart';
import '../uiblocks/ImageButton.dart';
import '../uiblocks/VideoButton.dart';

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
  final VideoImageHashManager videoImageHashManager =
      VideoImageHashManager(HashLogic());
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
              ImageButton(
                imageManager: imageManager,
                videoImageHashManager: videoImageHashManager,
              ),
              VideoButton(
                videoManager: videoManager,
                videoImageHashManager: videoImageHashManager,
              )
            ],
          )),
    ));
  }
}