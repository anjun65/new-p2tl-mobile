class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? regus_id;
  String? roles;
  String? token;
  // int? tokenExpiresIn;
  // String? tokenType;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.regus_id,
    this.roles,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['data']['user']['id'];
    name = json['data']['user']['name'];
    email = json['data']['user']['email'];
    regus_id = json['data']['user']['regus_id'].toString();
    roles = json['data']['user']['roles'];
    token = json['data']['access_token'];
  }
  // UserModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   email = json['email'];
  //   regus_id = json['regus_id'];
  //   roles = json['roles'];
  //   token = json['access_token'];
  //   // tokenExpiresIn = json['token_expires_in'];
  //   // tokenType = json['token_type'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['regus_id'] = regus_id;
    data['roles'] = roles;
    data['access_token'] = token;
    return data;
  }

  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? password,
    String? regus_id,
    String? roles,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        regus_id: regus_id ?? this.regus_id,
        roles: roles ?? this.roles,
        token: token,
      );
}
