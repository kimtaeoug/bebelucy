class ProfileBirthModel{
  final int id;
  final int birth;
  ProfileBirthModel({required this.id, required this.birth});
  factory ProfileBirthModel.fromJson(Map<String, dynamic> json) => ProfileBirthModel(
    id: json['id'],
    birth: json['birth']
  );
  Map<String, dynamic> toMap() => <String, dynamic>{
    'id':id,
    'birth':birth
  };
}
