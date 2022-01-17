class WeightModel{
  final int id;
  final double weight;
  final String date;
  WeightModel({required this.id, required this.weight, required this.date});
  factory WeightModel.fromJson(Map<String, dynamic> json) => WeightModel(id: json['id'], weight: json['weight'], date: json['date']);
  Map<String, dynamic> toMap() => <String, dynamic>{
    'id' : id,
    'weight' :weight,
    'date' : date
  };
}
