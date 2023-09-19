import 'package:decentproof/features/hashing/logic/hasher/VideoImageHashManager.dart';
import 'package:decentproof/shared/ProcessingDialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
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
      width: size.width * .6,
      height: size.height * .2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (context) => const ProcessingDialog());
              try {
                String path = await videoManager.saveVideo();
                String hash =
                    await compute(videoImageHashManager.hashVideo, path);
                Navigator.of(context).pushNamed("/submissionPage",
                    arguments: {"hash": hash, "path": path});
              } catch (e) {
                Navigator.of(context).pop();
              }
            },
            radius: size.width,
            splashColor: Colors.orangeAccent,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.video_file,
                    size: 100.0,
                  ),
                  const Text("videoImagePage.video",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0))
                      .tr()
                ]),
          )),
    );
  }
}
