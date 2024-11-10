import 'dart:typed_data';

class PosterModel {
  String posterId;
  String title;
  String desc;
  bool posterStatus;
  String posterUrl;
  String? image;
  Uint8List? imageBytes;
  String? mimeType;

  PosterModel({
    required this.posterId,
    required this.title,
    required this.desc,
    required this.posterStatus,
    required this.posterUrl,
    this.image,
    this.imageBytes,
    this.mimeType,
  });

  factory PosterModel.fromJson(Map<String, dynamic> data) {
    return PosterModel(
      posterId: data['PosterId'],
      title: data['PosterTitle'],
      desc: data['PosterDescription'],
      posterStatus: data['PosterStatus'],
      posterUrl:
          "https://pub-c2ce9a1d454a457ba9303eb6f3de07a2.r2.dev/${data['PosterId']}",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PosterTitle': title,
      'PosterDescription': desc,
      'PosterStatus': posterStatus,
      'posterUrl': posterUrl,
      'image': imageBytes,
      'mimeType': mimeType,
    };
  }
}
