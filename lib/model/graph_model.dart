class GraphModel {
  double? amount;
  DateTime? date;

  GraphModel({this.amount, this.date});

  factory GraphModel.fromJson(Map<String, dynamic> json) {
    return GraphModel(
      amount: json['amount'] as double,
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'date': date,
    };
  }
}
