import 'package:decentproof/pages/settingspage/logic/DevNetLogic.dart';
import 'package:flutter/material.dart';

class DevNetSwitch extends StatefulWidget {
  const DevNetSwitch({Key? key}) : super(key: key);

  @override
  _DevNetSwitchState createState() => _DevNetSwitchState();
}

class _DevNetSwitchState extends State<DevNetSwitch> {
  final DevNetLogic devNetLogic = DevNetLogic();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: devNetLogic.shouldUseDevNet,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? SizedBox(
                  width: 50,
                  height: 25,
                  child: Switch.adaptive(
                      value: snapshot.data!,
                      onChanged: (value) => setState(() {
                            devNetLogic.setShouldUseDevNet(value);
                          })),
                )
              : const CircularProgressIndicator.adaptive();
        });
  }
}
