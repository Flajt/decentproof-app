import 'dart:typed_data';

abstract class IFileSavingService {
  //TODO: Convert to saveFileFromStream
  Future<String> saveFile();
}
