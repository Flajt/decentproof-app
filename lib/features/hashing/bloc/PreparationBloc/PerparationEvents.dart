abstract class MetaDataEvents {}

class PrepareVideo extends MetaDataEvents {}

class PrepareAudio extends MetaDataEvents {
  String filePath;
  PrepareAudio(this.filePath);
}

class PrepareImage extends MetaDataEvents {}
