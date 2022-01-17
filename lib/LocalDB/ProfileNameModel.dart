class ProfileNameModel{
  final int id;
  final String name;
  ProfileNameModel({required this.id, required this.name});
  factory ProfileNameModel.fromJson(Map<String, dynamic> json) => ProfileNameModel(
    id: json['id'],
    name: json['name']
  );
  Map<String, dynamic> toMap() => <String, dynamic>{
    'id' : id,
    'name' : name
  };
}
