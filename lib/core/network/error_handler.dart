import 'dart:io';

import 'package:chitchat/core/network/api_error_model.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static ApiErrorModel hanlde(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
              message:
                  'Sorry, it looks like you are not connected to the internet. Please check your connection and try again.');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message:
                  'The request timed out while sending data. Please try again.');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message:
                  'The request timed out while receiving data. Please try again.');
        case DioExceptionType.badCertificate:
          return ApiErrorModel(
              message:
                  'There seems to be an issue with the server\'s certificate. Please try again later.');
        case DioExceptionType.badResponse:
          return _handleError(error.response);
        case DioExceptionType.cancel:
          return ApiErrorModel(
              message: 'The request was canceled. Please try again.');
        case DioExceptionType.connectionError:
          return ApiErrorModel(
              message:
                  'Unable to connect to the server. Please check your internet connection and try again.');
        case DioExceptionType.unknown:
          if (error.error.toString().contains("SocketException")) {
            return ApiErrorModel(message: "No Internet connection.");
          } else {
            return ApiErrorModel(
                message:
                    'An unexpected error occurred. Please try again later.');
          }
      }
    } else if (error is SocketException) {
      return ApiErrorModel(message: "No Internet connection.");
    } else {
      return ApiErrorModel(
          message: 'An unexpected error occurred. Please try again later.');
    }
  }
}

ApiErrorModel _handleError(Response? response) {
  var result = response?.data;
  return ApiErrorModel.fromJson(result);
}
