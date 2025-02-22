import 'package:json_annotation/json_annotation.dart';

part 'resend_email_verification_request_body.g.dart';

@JsonSerializable()
class ResendEmailVerificationRequestBody {
  final String email;

  ResendEmailVerificationRequestBody({
    required this.email,
  });

  Map<String, dynamic> toJson() =>
      _$ResendEmailVerificationRequestBodyToJson(this);
}
