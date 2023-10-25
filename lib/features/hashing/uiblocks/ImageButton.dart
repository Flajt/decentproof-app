import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/features/hashing/interfaces/IHashingService.dart';
import 'package:decentproof/features/hashing/interfaces/IWaterMarkService.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../shared/uiblocks/ProcessingDialog.dart';

class ImageButton extends StatelessWidget {
  ImageButton({Key? key}) : super(key: key) {
    imageManager = getIt.get<IFileSavingService>(instanceName: "ImageSaving");
    hashingService = getIt.get<IHashingService>(instanceName: "ImageHashing");
    waterMarkService =
        getIt.get<IWaterMarkService>(instanceName: "ImageWaterMark");
  }
  final getIt = GetIt.I;
  late final IFileSavingService imageManager;
  late final IHashingService hashingService;
  late final IWaterMarkService waterMarkService;
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
              if (context.mounted) {
                showDialog(
                    context: context,
                    builder: (context) => const ProcessingDialog());
                String hash = await hashingService.hash(path);
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed("/submissionPage",
                    arguments: {"hash": hash, "path": path});
              }
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
