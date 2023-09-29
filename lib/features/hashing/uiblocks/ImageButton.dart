import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../shared/uiblocks/ProcessingDialog.dart';
import '../logic/ImageSavingService.dart';

class ImageButton extends StatelessWidget {
  const ImageButton(
      {Key? key, required this.imageManager, required this.hashingService})
      : super(key: key);
  final IFileSavingService imageManager;
  final IHashingService hashingService;
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
              String path = await imageManager.saveFile();
              showDialog(
                  context: context,
                  builder: (context) => const ProcessingDialog());
              String hash = await hashingService.hash(path);
              Navigator.of(context).pushNamed("/submissionPage",
                  arguments: {"hash": hash, "path": path});
            },
            radius: size.width,
            splashColor: Colors.orangeAccent,
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
