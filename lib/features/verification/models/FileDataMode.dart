class FileDataModel {
  FileDataModel({required this.byteStream, required this.fileName});
  Stream<List<int>> byteStream;
  String fileName;
}
