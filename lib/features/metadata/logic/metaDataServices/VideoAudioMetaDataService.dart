import 'dart:async';
import 'dart:io';

import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter/session_state.dart';

class VideoAudioMetaDataService implements IMetaDataService {
  //This class can do the work for both audio and video files, it would be duplication to split it
  @override
  Future<String> addLocation(
      LocationModel locationModel, String filePath) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst("n_", "");
    await FFprobeKit.executeAsync(
        "-i $filePath -c copy -movflags use_metadata_tags 0 -metadata latitude=${locationModel.latitude} -metadata longitude=${locationModel.longitude} $outputPath",
        (session) async {
      if (await session.getState() == SessionState.completed) {
        completer.complete(true);
      } else {
        completer.complete(false);
      }
    });
    bool success = await completer.future;
    if (success) {
      await File(filePath).delete(); // clean up
      return filePath;
    }
    throw "Error adding location to video";
  }

  @override
  Future<String> addLocationAndSecret(
      LocationModel locationModel, String secretHash, String filePath) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst("n_", "");

    await FFprobeKit.executeAsync(
        "-i $filePath -c copy -movflags use_metadata_tags 0 -metadata latitude=${locationModel.latitude} -metadata longitude=${locationModel.longitude} -metadata comment=$secretHash $outputPath",
        (session) async {
      if (await session.getState() == SessionState.completed) {
        completer.complete(true);
      } else {
        completer.complete(false);
      }
    });
    bool success = await completer.future;
    if (success) {
      await File(filePath).delete(); // clean up
      return filePath;
    }
    throw "Error adding location to video";
  }

  @override
  Future<String> addSecret(String secretHash, String filePath) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst("n_", "");
    await FFprobeKit.executeAsync(
        "-i $filePath -c copy -movflags use_metadata_tags 0 -metadata comment=$secretHash $outputPath",
        (session) async {
      if (await session.getState() == SessionState.completed) {
        completer.complete(true);
      } else {
        completer.complete(false);
      }
    });
    bool success = await completer.future;
    if (success) {
      await File(filePath).delete(); // Clean up
      return filePath;
    }
    throw "Error adding seceret to video";
  }
}
