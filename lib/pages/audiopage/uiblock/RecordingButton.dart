import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:decentproof/pages/audiopage/logic/AudioManager.dart';
import 'package:decentproof/shared/ProcessingDialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../logic/HashAudioManager.dart';

class RecordingButton extends StatefulWidget {
  const RecordingButton(
      {Key? key,
      required this.controller,
      required this.audioManager,
      required this.hashAudioManager})
      : super(key: key);
  final RecorderController controller;
  final AudioManager audioManager;
  final HashAudioManager hashAudioManager;
  @override
  _RecordingButtonState createState() => _RecordingButtonState();
}

class _RecordingButtonState extends State<RecordingButton> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
          if (!widget.controller.hasPermission) {
            await widget.controller.checkPermission();
          }
          isRecording = !isRecording;
          String savePath = await widget.audioManager.audioPath;
          if (isRecording) {
            await widget.controller.record(path: savePath);
          } else {
            String path = await widget.controller.stop(true) as String;
            showDialog(
                context: context,
                builder: (context) => const ProcessingDialog());
            String hash =
                await compute(widget.hashAudioManager.hashAudio, path);
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed("/submissionPage",
                arguments: {"hash": hash, "path": path});
          }
          setState(() {});
        },
        child: isRecording ? const Icon(Icons.stop) : const Icon(Icons.mic));
  }
}
