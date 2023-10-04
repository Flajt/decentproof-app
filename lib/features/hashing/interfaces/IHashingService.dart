// ignore_for_file: file_names
///Abstraction for hashing service
abstract class IHashingService {
  ///Hashes file from the given path
  Future<String> hash(String path);
}
