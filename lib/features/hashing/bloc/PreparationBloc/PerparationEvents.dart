abstract class MetaDataEvents {
  String filePath;
  MetaDataEvents(this.filePath);
}

class PrepareVideo extends MetaDataEvents {
  PrepareVideo(super.filePath);
}

class PrepareAudio extends MetaDataEvents {
  PrepareAudio(super.filePath);
}

class PrepareImage extends MetaDataEvents {
  PrepareImage(super.filePath);
}
