import 'dart:typed_data';

class ProfileImageModel{
  final int id;
  final Uint8List image;
  ProfileImageModel({required this.id, required this.image});
  factory ProfileImageModel.fromJson(Map<String, dynamic> json) => ProfileImageModel(
    id: json['id'],
    image: json['image']
  );
  Map<String, dynamic> toMap() => <String, dynamic>{
    'id' : id,
    'image' : image
  };
}
