import 'package:decentproof/pages/videoimagepage/logic/ImageManger.dart';
import 'package:decentproof/pages/videoimagepage/logic/VideoImageHashManager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../shared/ProcessingDialog.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(
      {Key? key,
      required this.imageManager,
      required this.videoImageHashManager})
      : super(key: key);
  final ImageManager imageManager;
  final VideoImageHashManager videoImageHashManager;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .6,
      height: size.height * .2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              String path = await imageManager.saveImage();
              showDialog(
                  context: context,
                  builder: (context) => const ProcessingDialog());
              String hash = await videoImageHashManager.hashImage(path);
              Navigator.of(context)
                  .pushNamed("/submissionPage", arguments: {"hash": hash});
            },
            radius: size.width,
            splashColor: Colors.lightGreenAccent,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.camera,
                    size: 100.0,
                  ),
                  Text("videoImagePage.photo".tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0))
                ]),
          )),
    );
  }
}
