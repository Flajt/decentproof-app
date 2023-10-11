import 'package:decentproof/features/verification/interfaces/IFileSelectionService.dart';
import 'package:decentproof/features/verification/logic/FileSelectionService.dart';
import 'package:decentproof/features/verification/logic/SelectHashAndVerifyLogic.dart';
import 'package:decentproof/shared/uiblocks/ErrorDialog.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/uiblocks/ProcessingDialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../hashing/logic/backend/ShowInExplorer.dart';
import '../../settings/logic/DevNetLogic.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String? hash;
  String? messageId;
  bool isVerfied = false;
  late final ShowInExplorer showInExplorer;
  late final HashLogic hashLogic;
  //late final VerificationLogic verificationLogic;
  late final IFileSelectionService fileSelectionLogic;
  late final SelectHashAndVerifyLogic selectHashAndVerifyLogic;
  late final bool shouldUseDevNet;
  final DevNetLogic devNetLogic = DevNetLogic();
  @override
  void initState() {
    super.initState();
    showInExplorer = ShowInExplorer();
    hashLogic = HashLogic();
    fileSelectionLogic = FileSelectionService();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    shouldUseDevNet = await devNetLogic.shouldUseDevNet;
    /*verificationLogic =
        VerificationLogic(MessageVerificationService(), shouldUseDevNet);*/
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox.fromSize(
              size: size,
              child: Stack(children: [
                isVerfied
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "verificationPage.notModified".tr(),
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ))
                    : Container(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: OutlinedButton(
                      onPressed: () async {
                        try {
                          showDialog(
                              context: context,
                              builder: (context) => const ProcessingDialog());
                          Map<String, String>? data =
                              await selectHashAndVerifyLogic.check();
                          if (data != null) {
                            Navigator.of(context).pop();
                            hash = data["hash"];
                            messageId = data["messageId"];
                            isVerfied = true;
                          }
                          setState(() {});
                        } catch (e, stack) {
                          Navigator.of(context).pop();
                          isVerfied = false;
                          messageId = null;
                          hash = null;
                          setState(() {});
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  ErrorDialog(size: size, error: e.toString()));
                        }
                        //Navigator.of(context).pop();
                      },
                      child: const Text("verificationPage.selectFile").tr()),
                ),
                Positioned(
                  width: size.width,
                  top: size.height * .25,
                  child: hash != null
                      ? SelectableText(
                          "${"verificationPage.hash".tr()}\n\n$hash",
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        )
                      : Center(
                          child: Text(
                          "verificationPage.noFile".tr(),
                          style: const TextStyle(fontSize: 18.0),
                        )),
                ),
                messageId != null
                    ? Positioned(
                        width: size.width - 10,
                        height: size.height * .2,
                        bottom: size.height * .2,
                        child: TextButton(
                            onPressed: () => showInExplorer.show(
                                messageId!, shouldUseDevNet),
                            child: SelectableText(
                              "${"verificationPage.id".tr()}:\n\n $messageId",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                              textAlign: TextAlign.center,
                            )))
                    : Container()
              ]))),
    );
  }
}
