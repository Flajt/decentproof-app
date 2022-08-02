import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:decentproof/pages/audiopage/logic/AudioManager.dart';
import 'package:decentproof/pages/homepage/logic/hashAudioManager.dart';
import 'package:flutter/material.dart';

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
          isRecording = !isRecording;
          String savePath = await widget.audioManager.audioPath;
          isRecording == true
              ? await widget.controller.record(savePath)
              : await widget.controller.stop(true);
          setState(() {});
          String hash = await widget.hashAudioManager.hashAudio(savePath);
          Navigator.of(context)
              .pushNamed("/submissionPage", arguments: {"hash": hash});
        },
        child: isRecording ? const Icon(Icons.stop) : const Icon(Icons.mic));
  }
}
