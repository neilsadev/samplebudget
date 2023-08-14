class Budget {
  String? title;
  int? amount;
  String? tag;
  int? userId;

  Budget({this.title, this.amount, this.tag, this.userId});

  Budget.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    amount = json['amount'];
    tag = json['tag'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['amount'] = amount;
    data['tag'] = tag;
    data['user_id'] = userId;
    return data;
  }
}
