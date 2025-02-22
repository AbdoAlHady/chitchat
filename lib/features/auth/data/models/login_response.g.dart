// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      token: json['token'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      id: json['id'] as String,
      userName: json['username'] as String,
      email: json['email'] as String,
      isVerified: json['is_verified'] as bool,
    );
