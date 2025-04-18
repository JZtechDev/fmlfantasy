class TransactionModel {
  double? id;
  String? userId;
  String? transactionType;
  double? amount;
  String? description;
  String? transactionTime;
  String? tournamentId;

  TransactionModel(
      {this.id,
      this.userId,
      this.transactionType,
      this.amount,
      this.description,
      this.transactionTime,
      this.tournamentId});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    transactionType = json['transactionType'];
    amount = json['amount'];
    description = json['description'];
    transactionTime = json['transactionTime'];
    tournamentId = json['tournamentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['transactionType'] = transactionType;
    data['amount'] = amount;
    data['description'] = description;
    data['transactionTime'] = transactionTime;
    data['tournamentId'] = tournamentId;
    return data;
  }
}
