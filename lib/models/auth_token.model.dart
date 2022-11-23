class AuthTokenModel {
  String token;

  AuthTokenModel({required this.token});

  factory AuthTokenModel.fromJson(final Map<String, dynamic> json) =>
      AuthTokenModel(
        token: json['token'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{'token': token};
}
