import 'dart:io';
import 'dart:typed_data';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:decentproof/features/hashing/interfaces/IMediaPickerService.dart';

class ImagePickerWrapper implements IMediaPickerService {
  @override
  Future<Uint8List> getImageAsBytes() async {
    File? file;
    CameraAwesomeBuilder.awesome(
        onMediaTap: (capture) => file = File(capture.captureRequest.path!),
        sensorConfig:
            SensorConfig.single(sensor: Sensor.position(SensorPosition.back)),
        saveConfig: SaveConfig.photo());
    if (file != null) {
      return await file!.readAsBytes();
    }
    throw "No image taken";
  }

  @override
  Future<Uint8List> getVideoAsBytes() async {
    if (Platform.isAndroid) {
      throw "Android is currently not supported, I'm working on it!";
    }
    File? file;
    CameraAwesomeBuilder.awesome(
        sensorConfig:
            SensorConfig.single(sensor: Sensor.position(SensorPosition.back)),
        onMediaTap: (capture) => file = File(capture.captureRequest.path!),
        saveConfig: SaveConfig.video(
            videoOptions: VideoOptions(
                enableAudio: true,
                ios: CupertinoVideoOptions(
                    fileType: CupertinoFileType.mpeg4,
                    codec: CupertinoCodecType.appleProRes422))));
    if (file != null) {
      Uint8List bytes = await file!.readAsBytes(); //TODO: Use openRead
      return bytes;
    }
    throw "No video taken";
  }
}
