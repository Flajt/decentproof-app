import 'dart:typed_data';

///Wrapper for media file selection
abstract class IMediaPickerService {
  ///Propmpts user to select a video returns as [Uint8List]
  Future<Uint8List> getVideoAsBytes();

  ///Propmpts user to select an image returns as [Uint8List]

  Future<Uint8List> getImageAsBytes();
}
