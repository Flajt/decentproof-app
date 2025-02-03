import 'dart:async';
import 'dart:io';

import 'package:decentproof/constants.dart';
import 'package:decentproof/features/metadata/enum/BlockChainEnum.dart';
import 'package:decentproof/features/metadata/interfaces/IMetaDataService.dart';
import 'package:decentproof/features/metadata/models/LocationModel.dart';
import 'package:decentproof/features/metadata/models/MetaDataModel.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';

class AudioMetaDataService implements IMetaDataService {
  static const versionCommand =
      "-metadata software='Decentproof $DPM_VERSION'"; //decentproof metadata version
  @override
  Future<String> addLocation(LocationModel locationModel, String filePath,
      BlockChain blockChain) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst("n_", "f_");

    await FFmpegKit.executeAsync(
        "-i $filePath -movflags use_metadata_tags -metadata latitude=${locationModel.latitude} -metadata longitude=${locationModel.longitude} -metadata _blockchain=${blockChain.name} $versionCommand $outputPath",
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
    throw "Error adding location to audio";
  }

  @override
  Future<String> addLocationAndSecret(LocationModel locationModel,
      String secretHash, String filePath, BlockChain blockChain) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst("n_", "f_");

    await FFmpegKit.executeAsync(
        "-i $filePath -movflags use_metadata_tags -metadata latitude=${locationModel.latitude} -metadata longitude=${locationModel.longitude} -metadata comment=$secretHash -metadata _blockchain=${blockChain.name} $versionCommand $outputPath",
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
    throw "Error adding location & secret to audio";
  }

  @override
  Future<String> addSecret(
      String secretHash, String filePath, BlockChain blockChain) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst("n_", "f_");
    await FFmpegKit.executeAsync(
        "-i $filePath -movflags use_metadata_tags -metadata comment=$secretHash -metadata _blockchain=${blockChain.name} $versionCommand $outputPath",
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
    throw "Error adding seceret to audio";
  }

  @override
  Future<MetaDataModel> retriveMetaData(String filePath) async {
    final data = Completer<Map<dynamic, dynamic>>();
    String? secretHash;
    LocationModel? location;
    BlockChain? blockChain;
    String? dpmVersion;
    await FFprobeKit.getMediaInformationAsync(filePath, (session) {
      final information = session.getMediaInformation();
      if (information == null) {
        data.completeError("Failure to get media information");
      } else {
        data.complete(information.getAllProperties());
      }
    });
    Map<dynamic, dynamic> completerData = await data.future;
    final tags = completerData["streams"][0]["tags"];
    if (tags.containsKey("comment")) {
      secretHash = tags["comment"];
    }
    if (tags.containsKey("latitude") && tags.containsKey("longitude")) {
      location = LocationModel(
        latitude: double.parse(tags["latitude"]),
        longitude: double.parse(tags["longitude"]),
      );
    }
    if (tags.containsKey("_blockchain")) {
      blockChain = BlockChain.values
          .firstWhere((element) => element.name == tags["_blockchain"]);
    } else {
      throw "No Blockchain found!";
    }
    if (tags.containsKey("software")) {
      dpmVersion = tags["software"];
      dpmVersion = dpmVersion!.split(" ")[1];
    } else {
      throw "No DPM Version found!";
    }

    return MetaDataModel(
      secretHash,
      location,
      dpmVersion,
      blockChain,
    );
  }

  @override
  Future<String> addBasicMetaData(
      String filePath, BlockChain blockChain) async {
    final Completer<bool> completer = Completer<bool>();
    String outputPath = filePath.replaceFirst("n_", "f_");
    await FFmpegKit.executeAsync(
        "-i $filePath -movflags use_metadata_tags -metadata _blockchain=${blockChain.name} $versionCommand $outputPath",
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
}
