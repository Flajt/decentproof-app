import 'package:decentproof/pages/Integrety/SecureStorageWrapper.dart';
import 'package:decentproof/pages/settingspage/logic/DevNetLogic.dart';
import 'package:decentproof/pages/submissionpage/logic/MessageSigningService.dart';
import 'package:decentproof/pages/submissionpage/logic/SaveToTangleLogic.dart';
import 'package:decentproof/pages/submissionpage/logic/ShowInExplorer.dart';
import 'package:decentproof/pages/submissionpage/uiblocks/BackToHomeButton.dart';
import 'package:decentproof/pages/submissionpage/uiblocks/ShareButton.dart';
import 'package:decentproof/shared/ErrorDialog.dart';
import 'package:decentproof/shared/ProcessingDialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({Key? key}) : super(key: key);
  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  bool hasMessageId = false;
  String? messageId;
  final DevNetLogic devNetLogic = DevNetLogic();
  late bool shouldUseDevNet;
  late final ShowInExplorer showInExplorer = ShowInExplorer();
  final signingService = MessageSigningService(SecureStorageWrapper());

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    shouldUseDevNet = await devNetLogic.shouldUseDevNet;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
        body: SafeArea(
            child: SizedBox.fromSize(
      size: size,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShareButton(filePath: args["path"]!)),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: BackToHomeButton(),
            ),
          ),
          Positioned(
            height: size.height * .1,
            width: size.width - 10,
            top: size.height * .2,
            child: Text(
              "${"submissionPage.hash".tr()}\n\n ${args["hash"]}",
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          hasMessageId
              ? Positioned(
                  width: size.width - 10,
                  height: size.height * .2,
                  bottom: size.height * .2,
                  child: TextButton(
                      onPressed: () =>
                          showInExplorer.show(messageId!, shouldUseDevNet),
                      child: SelectableText(
                        "${"submissionPage.messageid".tr()}\n\n $messageId",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                        textAlign: TextAlign.center,
                      )))
              : Container(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        showDialog(
                            context: context,
                            builder: (context) => const ProcessingDialog());
                        final DateTime dateTime = DateTime.now();
                        String signature = await signingService.signMessage(
                            args["hash"] as String, dateTime);
                        messageId = await SaveToTangleLogic(
                                signature, dateTime, shouldUseDevNet)
                            .save(args["hash"] as String);
                        hasMessageId = true;
                        Navigator.of(context).pop();
                        setState(() {});
                      } catch (e) {
                        Navigator.of(context).pop();
                        showDialog(
                            context: context,
                            builder: (context) =>
                                ErrorDialog(size: size, error: e.toString()));
                      }
                    },
                    child: const Text("submissionPage.submitt").tr()),
              ))
        ],
      ),
    )));
  }
}
