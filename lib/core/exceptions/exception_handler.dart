import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/base_bloc_states.dart';
import 'package:news_app/core/failures/failures.dart';

class CustomExceptionHandler implements Exception {
  static Failure handleException(DioException e) {
    if (e.error is TimeoutException) {
      return const CustomTimeoutException(message: "Timeout Exception");
    } else if (e.error is FormatException) {
      return const ParsingException(message: "Invalid Format");
    } else if (e.error is HttpException) {
      return const APIException(message: "Invalid Request");
    } else if (e.error is SocketException) {
      return const NetworkException(message: "Server Error");
    } else {
      return const Failure(message: "An error occurred");
    }
  }

  static Map<String, dynamic> handleExceptionToMap(Failure e) {
    if (e is CustomTimeoutException) {
      return {
        "error": "Timeout Error",
      };
    } else if (e is ParsingException) {
      return {
        "error": "Invalid Format",
      };
    } else if (e is APIException) {
      return {
        "error": "Invalid Request",
      };
    } else if (e is NetworkException) {
      return {
        "error": "No internet",
      };
    } else {
      return {
        "error": "Something went wrong",
      };
    }
  }

  static Map<String, dynamic> exceptions = {
    "Timeout Error": const TimeoutErrorState(),
    "Invalid Format": const ParsingErrorState(),
    "Invalid Request": const FormatExceptionState(),
    "No internet": const NoInternetState(),
    "Something went wrong": const ServerErrorState()
  };
}
