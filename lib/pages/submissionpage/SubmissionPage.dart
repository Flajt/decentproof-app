import 'package:decentproof/pages/submissionpage/logic/SaveToTangleLogic.dart';
import 'package:flutter/material.dart';

class SubmissionPage extends StatelessWidget {
  const SubmissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(args["hash"] ?? "No Hash"),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () =>
                        SaveToTangleLogic().save(args["hash"] as String),
                    child: const Text("Submitt")),
              ))
        ],
      ),
    )));
  }
}
