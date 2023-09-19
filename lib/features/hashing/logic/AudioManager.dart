import 'dart:io';

import 'package:nanoid/async.dart';
import 'package:path_provider/path_provider.dart';

class AudioManager {
  Future<String> get audioPath async => Platform.isAndroid
      ? "${(await getExternalStorageDirectories(type: StorageDirectory.podcasts))![0].path}/${await nanoid(16)}.aac"
      : "${(await getApplicationDocumentsDirectory()).path}/${await nanoid(16)}.aac";
}
