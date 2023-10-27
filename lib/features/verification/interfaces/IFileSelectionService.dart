import 'package:decentproof/features/verification/models/FileDataMode.dart';

abstract class IFileSelectionService {
  Future<FileDataModel?> selectFileAsStream();
}
