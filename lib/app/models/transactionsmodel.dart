class Alltransactions {
  bool status;
  String message;
  List<Datum> data;

  Alltransactions({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Alltransactions.fromJson(Map<String, dynamic> json) {
    return Alltransactions(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<Datum>.from(json['data'].map((x) => Datum.fromJson(x)))
          : [],
    );
  }
}

class Datum {
  int transactionId;
  String amount;
  Type type;
  String category;
  String description;
  String transactionDate;
  String balance;
  DateTime createdAt;

  Datum({
    required this.transactionId,
    required this.amount,
    required this.type,
    required this.category,
    required this.description,
    required this.transactionDate,
    required this.balance,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      transactionId: json['transaction_id'],
      amount: json['amount'],
      type: json['type'].toLowerCase() == 'credit' ? Type.CREDIT : Type.DEBIT,
      category: json['category'],
      description: json['description'],
      transactionDate: json['transaction_date'],
      balance: json['balance'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

enum Type { CREDIT, DEBIT }
