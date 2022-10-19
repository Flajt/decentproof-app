import 'package:decentproof/pages/settingspage/logic/DevNetLogic.dart';
import 'package:decentproof/pages/submissionpage/logic/ShowInExplorer.dart';
import 'package:decentproof/pages/submissionpage/logic/VerificationService.dart';
import 'package:decentproof/pages/verificationpage/logic/FileSelectionLogic.dart';
import 'package:decentproof/pages/verificationpage/logic/SelectHashAndVerifyLogic.dart';
import 'package:decentproof/pages/verificationpage/logic/VerificationLogic.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:decentproof/shared/ProcessingDialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  late final VerificationLogic verificationLogic;
  late final FileSelectionLogic fileSelectionLogic;
  late final SelectHashAndVerifyLogic selectHashAndVerifyLogic;
  late final bool shouldUseDevNet;
  final DevNetLogic devNetLogic = DevNetLogic();
  @override
  void initState() {
    super.initState();
    showInExplorer = ShowInExplorer();
    hashLogic = HashLogic();
    fileSelectionLogic = FileSelectionLogic();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    shouldUseDevNet = await devNetLogic.shouldUseDevNet;
    verificationLogic =
        VerificationLogic(VerificationService(), shouldUseDevNet);
    selectHashAndVerifyLogic = SelectHashAndVerifyLogic(
        hashLogic, verificationLogic, fileSelectionLogic);
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
                    ? const Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "It seems that your file hasn't been modified",
                            style: TextStyle(
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
                          print(data);
                          if (data != null) {
                            Navigator.of(context).pop();
                            hash = data["hash"];
                            messageId = data["messageId"];
                            isVerfied = true;
                          }
                          setState(() {});
                        } catch (e, stack) {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    child: SizedBox(
                                      width: size.width * .4,
                                      height: size.height * .4,
                                      child: Stack(
                                        children: [
                                          const Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Text(
                                                  "An error occured",
                                                  style: TextStyle(
                                                      fontSize: 25.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )),
                                          Center(
                                            child: Text(e.toString(),
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                                textAlign: TextAlign.center),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                        }
                        //Navigator.of(context).pop();
                      },
                      child: const Text("Select File")),
                ),
                Positioned(
                  width: size.width,
                  top: size.height * .25,
                  child: hash != null
                      ? Text(
                          "Your Hash:\n\n$hash",
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        )
                      : const Center(
                          child: Text(
                          "No file selected!",
                          style: TextStyle(fontSize: 18.0),
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
                            child: Text(
                              "Message ID:\n\n $messageId",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                              textAlign: TextAlign.center,
                            )))
                    : Container()
              ]))),
    );
  }
}
