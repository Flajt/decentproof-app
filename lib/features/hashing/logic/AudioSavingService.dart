import 'dart:io';

import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';

import '../interfaces/IFileSavingService.dart';

class AudioSavingService implements IFileSavingService {
  @override
  Future<String> saveFile() async {
    return Platform.isAndroid
        ? "${(await getExternalStorageDirectories(type: StorageDirectory.podcasts))![0].path}/${await nanoid(16)}.aac"
        : "${(await getApplicationDocumentsDirectory()).path}/${await nanoid(16)}.aac";
  }
}
