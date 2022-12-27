import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:decentproof/pages/audiopage/logic/AudioManager.dart';
import 'package:decentproof/pages/audiopage/uiblock/RecordingButton.dart';
import 'package:decentproof/shared/HashLogic.dart';
import 'package:flutter/material.dart';

import 'logic/HashAudioManager.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late final RecorderController recorderController;
  @override
  void initState() {
    super.initState();
    recorderController = RecorderController()
      ..androidOutputFormat = AndroidOutputFormat.aac_adts
      ..bitRate = 48000
      ..sampleRate = 44100
      ..shouldClearLabels;
  }

  @override
  void dispose() {
    recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          Align(
            child: AudioWaveforms(
              size: Size(size.width * .8, 150),
              recorderController: recorderController,
              waveStyle: WaveStyle(
                  showDurationLabel: true,
                  durationLinesColor: Colors.transparent,
                  waveColor: Theme.of(context).primaryColor,
                  extendWaveform: true,
                  showMiddleLine: false),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RecordingButton(
                controller: recorderController,
                audioManager: AudioManager(),
                hashAudioManager: HashAudioManager(HashLogic()),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
