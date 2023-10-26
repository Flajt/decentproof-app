import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathUtil {
  static Future<Directory> getStoragePath(StorageDirectory type) async {
    if (Platform.isAndroid) {
      return (await getExternalStorageDirectories(type: type))![0];
    }
    return await getApplicationDocumentsDirectory();
  }
}
