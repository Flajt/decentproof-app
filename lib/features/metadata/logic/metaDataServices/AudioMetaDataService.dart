import 'dart:async';
import 'dart:io';

import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:ffmpeg_kit_flutter_full/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_full/return_code.dart';

class AudioMetaDataService implements IMetaDataService {
  @override
  Future<String> addLocation(
      LocationModel locationModel, String filePath) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst(".aac", ".mp3");

    await FFmpegKit.executeAsync(
        "-i $filePath -movflags use_metadata_tags -metadata latitude=${locationModel.latitude} -metadata longitude=${locationModel.longitude} $outputPath",
        (session) async {
      if (ReturnCode.isSuccess(await session.getReturnCode())) {
        completer.complete(true);
      } else {
        final logs = await session.getAllLogsAsString();
        completer.complete(false);
      }
    });
    bool success = await completer.future;
    if (success) {
      await File(filePath).delete(); // clean up
      return outputPath;
    }
    throw "Error adding location to video";
  }

  @override
  Future<String> addLocationAndSecret(
      LocationModel locationModel, String secretHash, String filePath) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst(".aac", ".mp3");

    await FFmpegKit.executeAsync(
        "-i $filePath -movflags use_metadata_tags -metadata latitude=${locationModel.latitude} -metadata longitude=${locationModel.longitude} -metadata comment=$secretHash $outputPath",
        (session) async {
      if (ReturnCode.isSuccess(await session.getReturnCode())) {
        completer.complete(true);
      } else {
        completer.complete(false);
      }
    });
    bool success = await completer.future;
    if (success) {
      await File(filePath).delete(); // clean up
      return outputPath;
    }
    throw "Error adding location to video";
  }

  @override
  Future<String> addSecret(String secretHash, String filePath) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst("n_", "f_");
    String finalOutputPath = outputPath.replaceFirst(".aac", ".mp3");
    await FFmpegKit.executeAsync(
        "-i $filePath -c copy -movflags use_metadata_tags -metadata comment=$secretHash $finalOutputPath",
        (session) async {
      if (ReturnCode.isSuccess(await session.getReturnCode())) {
        completer.complete(true);
      } else {
        completer.complete(false);
      }
    });
    bool success = await completer.future;
    if (success) {
      await File(filePath).delete(); // Clean up
      return outputPath;
    }
    throw "Error adding seceret to video";
  }

  @override
  Future<MetaDataModel> retriveMetaData(String filePath) async {
    final data = Completer<Map<dynamic, dynamic>>();
    String? secretHash;
    LocationModel? location;
    await FFprobeKit.getMediaInformationAsync(filePath, (session) {
      final information = session.getMediaInformation();
      if (information == null) {
        data.completeError("Failure to get media information");
      } else {
        data.complete(information.getTags());
      }
    });
    Map<dynamic, dynamic> tags = await data.future;
    if (tags.containsKey("COMMENT")) {
      secretHash = tags["COMMENT"];
    }
    if (tags.containsKey("LATITUDE") && tags.containsKey("LONGITUDE")) {
      location = LocationModel(
        latitude: double.parse(tags["LATITUDE"]),
        longitude: double.parse(tags["LONGITUDE"]),
      );
    }
    return MetaDataModel(secretHash, location);
  }
}
