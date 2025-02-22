import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponse {
  final String token;
  @JsonKey(name: 'data')
  final LoginData data;

  LoginResponse({
    required this.token,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class LoginData {
  final String id;
  @JsonKey(name: 'username')
  final String userName;
  final String email;
  @JsonKey(name: 'is_verified')
  final bool isVerified;

  LoginData(
      {required this.id,
      required this.userName,
      required this.email,
      required this.isVerified});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
