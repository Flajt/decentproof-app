import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PerparationEvents.dart';
import 'package:decentproof/features/hashing/bloc/PreparationBloc/PreparationBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoImageRecordingPage extends StatelessWidget {
  const VideoImageRecordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PreparationBloc>();
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        availableFilters: const [],
        defaultFilter: null,
        onMediaCaptureEvent: (mediaCaptureEvent) {
          if (mediaCaptureEvent.status == MediaCaptureStatus.success) {
            _handleRecordingFinished(mediaCaptureEvent, bloc, data["photo"]);
            Navigator.of(context).pop();
          }
        },
        saveConfig: data["photo"] == true
            ? SaveConfig.photo(
                exifPreferences: ExifPreferences(saveGPSLocation: false))
            : SaveConfig.video(
                videoOptions: VideoOptions(
                    enableAudio: true,
                    ios: CupertinoVideoOptions(
                        codec: CupertinoCodecType.jpeg,
                        fileType: CupertinoFileType.mpeg4))),
      ),
    );
  }

  _handleRecordingFinished(
      MediaCapture mediaCapture, PreparationBloc bloc, bool isPhoto) {
    if (isPhoto && mediaCapture.captureRequest.path != null) {
      bloc.add(PrepareImage(mediaCapture.captureRequest.path!));
    } else if (!isPhoto && mediaCapture.captureRequest.path != null) {
      bloc.add(PrepareVideo(mediaCapture.captureRequest.path!));
    }
  }
}
