class AuthTokenModel {
  String token;

  AuthTokenModel({required this.token});

  factory AuthTokenModel.fromJson(final Map<String, dynamic> json) =>
      AuthTokenModel(
        token: json['accessToken'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{'accessToken': token};
}
