class WallpaperModel {
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModel src;

  WallpaperModel(
      {required this.src,
      required this.photographer,
      required this.photographerId,
      required this.photographerUrl});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        src: SrcModel.fromMap(jsonData['src']),
        photographer: jsonData['photographer'],
        photographerId: jsonData['photographer_id'],
        photographerUrl: jsonData['photographer_url']);
  }
}

class SrcModel {
  String imgSmall;
  String imgOriginal;
  String imgPortrait;

  SrcModel(
      {required this.imgOriginal,
      required this.imgPortrait,
      required this.imgSmall});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        imgOriginal: jsonData['original'],
        imgPortrait: jsonData['portrait'],
        imgSmall: jsonData['small']);
  }
}
