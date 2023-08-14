class User {
  String? accessToken;
  String? tokenType;
  int? id;
  String? name;
  String? email;
  String? error;

  User({this.accessToken, this.tokenType, this.id, this.name, this.email});

  User.withError(String errorMessage) {
    error = errorMessage;
  }

  User.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
