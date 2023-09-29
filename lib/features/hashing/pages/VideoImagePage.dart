import 'package:decentproof/features/hashing/logic/ImagePickerWrapper.dart';
import 'package:decentproof/features/hashing/logic/hasher/ImageHashingService.dart';
import 'package:decentproof/features/hashing/logic/hasher/VideoHashingService.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:flutter/material.dart';

import '../logic/ImageSavingService.dart';
import '../logic/VideoManager.dart';
import '../uiblocks/ImageButton.dart';
import '../uiblocks/VideoButton.dart';

class VideoImagePage extends StatefulWidget {
  const VideoImagePage({Key? key}) : super(key: key);

  @override
  _VideoImagePageState createState() => _VideoImagePageState();
}

class _VideoImagePageState extends State<VideoImagePage> {
  final imageSavingService =
      ImageSavingService(imagePickerWrapper: ImagePickerWrapper());
  final videoSavingService = VideoSavingService(ImagePickerWrapper());
  final VideoHashingService videoHashingService =
      VideoHashingService(HashLogic());
  final imageHashingService = ImageHashingService(HashLogic());
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
                imageManager: imageSavingService,
                hashingService: imageHashingService,
              ),
              VideoButton(
                videoSavingService: videoSavingService,
                videoHashingService: videoHashingService,
              )
            ],
          )),
    ));
  }
}
