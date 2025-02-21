import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  final String message;

  const AppException({required this.message});

  @override
  String toString() => "AppException: $message";

  @override
  List<Object?> get props => [message];
}

// ⬇️ أخطاء مخصصة
class NetworkException extends AppException {
  const NetworkException({required super.message});
}

class ServerException extends AppException {
  const ServerException({required super.message});
}

class CacheException extends AppException {
  const CacheException({required super.message});
}
