import 'package:decentproof/pages/videoimagepage/logic/VideoImageHashManager.dart';
import 'package:flutter/material.dart';
import '../logic/VideoManager.dart';

class VideoButton extends StatelessWidget {
  const VideoButton(
      {Key? key,
      required this.videoManager,
      required this.videoImageHashManager})
      : super(key: key);
  final VideoManager videoManager;
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
              String path = await videoManager.saveVideo();
              String hash = await videoImageHashManager.hashVideo(path);
              Navigator.of(context)
                  .pushNamed("/submissionPage", arguments: {"hash": hash});
            },
            radius: size.width,
            splashColor: Colors.lightGreenAccent,
            child: Row(children: const [
              Icon(
                Icons.video_camera_front,
                size: 100.0,
              ),
              Text("Take a Video",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
            ]),
          )),
    );
  }
}
