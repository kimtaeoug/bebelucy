class ProfileGenderModel{
  final int id;
  final String gender;
  ProfileGenderModel({required this.id, required this.gender});
  factory ProfileGenderModel.fromJson(Map<String, dynamic> json) => ProfileGenderModel(
    id: json['id'],
    gender: json['gender']
  );
  Map<String, dynamic> toMap() => <String, dynamic>{
    'id' : id,
    'gender' : gender
  };
}
