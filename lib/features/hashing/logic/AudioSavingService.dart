import 'dart:io';

import 'package:decentproof/shared/util/PathUtil.dart';
import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';

import '../interfaces/IFileSavingService.dart';

class AudioSavingService implements IFileSavingService {
  @override
  Future<String> saveFile() async {
    Directory dir = await PathUtil.getStoragePath(StorageDirectory.podcasts);
    await dir.create(recursive: true);
    String path = dir.path;
    return "$path/${await nanoid(16)}.aac";
  }
}
