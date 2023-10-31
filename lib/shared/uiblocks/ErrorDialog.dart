import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, required this.size, required this.error})
      : super(key: key);
  final Size size;
  final String error;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: size.width * .4,
        height: size.height * .4,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "verificationPage.error".tr(),
                    style: const TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                )),
            Center(
              child: Text(error,
                  style: const TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
