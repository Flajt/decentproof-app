import 'package:flutter/material.dart';
import '../logic/VideoManager.dart';

class VideoButton extends StatelessWidget {
  const VideoButton({Key? key, required this.videoManager}) : super(key: key);
  final VideoManager videoManager;
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
            onTap: () async => await videoManager.saveVideo(),
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
