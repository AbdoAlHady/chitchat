import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String email;
  final String password;
  @JsonKey(name: 'username')
  final String userName;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.userName,
  });

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);
}
