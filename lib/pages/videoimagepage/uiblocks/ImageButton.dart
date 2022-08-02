import 'package:decentproof/pages/videoimagepage/logic/ImageManger.dart';
import 'package:decentproof/pages/videoimagepage/logic/VideoImageHashManager.dart';
import 'package:flutter/material.dart';

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
      width: size.width * .7,
      height: size.height * .3,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              String path = await imageManager.saveImage();
              String hash = await videoImageHashManager.hashImage(path);
              Navigator.of(context)
                  .pushNamed("/submissionPage", arguments: {"hash": hash});
            },
            radius: size.width,
            splashColor: Colors.lightGreenAccent,
            child: Row(children: const [
              Icon(
                Icons.photo,
                size: 100.0,
              ),
              Text("Take a Photo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
            ]),
          )),
    );
  }
}
