abstract class IFileSelectionService {
  Future<Stream<List<int>>?> selectFileAsStream();
}
