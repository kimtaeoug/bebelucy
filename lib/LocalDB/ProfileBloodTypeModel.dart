class ProfileBloodTypeModel{
  final int id;
  final String bloodType;
  ProfileBloodTypeModel({required this.id, required this.bloodType});
  factory ProfileBloodTypeModel.fromJson(Map<String, dynamic> json) => ProfileBloodTypeModel(
    id: json['id'],
    bloodType: json['bloodType']
  );
  Map<String, dynamic> toMap() => <String, dynamic>{
    'id':id,
    'bloodType':bloodType
  };
}
