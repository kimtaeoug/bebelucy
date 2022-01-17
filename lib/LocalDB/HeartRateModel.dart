class HeartRateModel{
  final int id;
  final double systolic;
  final double diastolic;
  final String date;
  HeartRateModel({required this.id, required this.systolic, required this.diastolic, required this.date});
  factory HeartRateModel.fromJson(Map<String, dynamic> json) => HeartRateModel(id: json['id'], systolic: json['systolic'], diastolic: json['diastolic'], date: json['date']);
  Map<String, dynamic> toMap() => <String, dynamic>{
    'id' : id,
    'systolic' : systolic,
    'diastolic' : diastolic,
    'date' : date
  };
}
