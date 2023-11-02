import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationEvents.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PreparationBloc.dart';
import 'package:decentproof/features/hashing/interfaces/IFileSavingService.dart';
import 'package:decentproof/shared/uiblocks/ProcessingDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../shared/uiblocks/ErrorDialog.dart';
import '../bloc/PreparationBloc/PerparationStates.dart';

class RecordingButton extends StatefulWidget {
  const RecordingButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final RecorderController controller;
  @override
  _RecordingButtonState createState() => _RecordingButtonState();
}

class _RecordingButtonState extends State<RecordingButton> {
  bool isRecording = false;
  late final IFileSavingService audioSavingService;

  @override
  void initState() {
    super.initState();
    audioSavingService =
        GetIt.I.get<IFileSavingService>(instanceName: "AudioSaving");
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocListener<PreparationBloc, PreparationState>(
      listener: (context, state) {
        if (state is PreparationHasError) {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) =>
                  ErrorDialog(size: size, error: state.errorMsg));
        } else if (state is PreparationIsSuccessfull) {
          Navigator.of(context).pushNamed("/submissionPage",
              arguments: {"hash": state.hash, "path": state.path});
        } else if (state is PrepareationIsAddingMetaData) {
          showDialog(
              context: context, builder: (context) => const ProcessingDialog());
        }
      },
      child: FloatingActionButton(
          onPressed: () async {
            if (!widget.controller.hasPermission) {
              await widget.controller.checkPermission();
            }
            isRecording = !isRecording;
            String savePath =
                await audioSavingService // This one here is just returning the save path for now
                    .saveFile();
            if (isRecording) {
              await widget.controller.record(path: savePath);
            } else {
              String path = await widget.controller.stop(true) as String;
              if (context.mounted) {
                context.read<PreparationBloc>().add(PrepareAudio(path));
              }
            }
            setState(() {});
          },
          child: isRecording ? const Icon(Icons.stop) : const Icon(Icons.mic)),
    );
  }
}
