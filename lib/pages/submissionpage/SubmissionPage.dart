import 'package:decentproof/pages/submissionpage/logic/SaveToTangleLogic.dart';
import 'package:decentproof/pages/submissionpage/logic/ShowInExplorer.dart';
import 'package:flutter/material.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({Key? key, required this.showInExplorer})
      : super(key: key);
  final ShowInExplorer showInExplorer;
  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  bool hasMessageId = false;
  String? messageId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      child: Stack(
        children: [
          Positioned(
            height: size.height * .1,
            width: size.width - 10,
            top: size.height * .2,
            child: Text(
              "Your Hash: \n\n ${args["hash"]}",
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
                      onPressed: () => widget.showInExplorer.show(messageId!),
                      child: Text(
                        "Message ID:\n\n $messageId",
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
                      messageId = await const SaveToTangleLogic()
                          .save(args["hash"] as String);
                      hasMessageId = true;
                      setState(() {});
                    },
                    child: const Text("Submitt")),
              ))
        ],
      ),
    )));
  }
}
