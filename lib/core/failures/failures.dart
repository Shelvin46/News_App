import 'package:equatable/equatable.dart';

///[Failure] is an class that is used to handle errors in the application
class Failure extends Equatable {
  final String message;
  const Failure({required this.message});
  @override
  List<Object> get props => [message];
}

class NetworkException extends Failure {
  const NetworkException({required super.message});
}

class APIException extends Failure {
  const APIException({required super.message});
}

class ParsingException extends Failure {
  const ParsingException({required super.message});
}

class CustomTimeoutException extends Failure {
  const CustomTimeoutException({required super.message});
}

class LocalDatabaseException extends Failure {
  const LocalDatabaseException({required super.message});
}


///[ServerFailure] is a class that is used to handle server errors in the application
///It extends the [Failure] class
///It takes in a [message] parameter which is a string
///It has a [toString] method that returns the message
///It has a [copyWith] method that returns a new instance of the [ServerFailure] class
///It has a [toJson] method that returns a map of the message
///It has a [fromJson] method that returns a new instance of the [ServerFailure] class
///It has a [fromMap] method that returns a new instance of the [ServerFailure] class
///It has a [toMap] method that returns a map of the message
///It has a [props] method that returns a list of the message
///It has a [==] method that returns a boolean value
///It has a [hashCode] method that returns the hashcode of the message
// class ServerFailure extends Failure {
//   const ServerFailure({required String message}) : super(message: message);
//   @override
//   String toString() => message;
//   ServerFailure copyWith({String? message}) {
//     return ServerFailure(message: message ?? this.message);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//     };
//   }

//   factory ServerFailure.fromJson(Map<String, dynamic> json) {
//     return ServerFailure(
//       message: json['message'],
//     );
//   }

//   factory ServerFailure.fromMap(Map<String, dynamic> map) {
//     return ServerFailure(
//       message: map['message'],
//     );
//   }

//   Map<String, dynamic> toMap() {q
//     return {
//       'message': message,
//     };
//   }

//   @override
//   List<Object> get props => [message];

//   @override
//   bool get stringify => true;

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is ServerFailure && other.message == message;
//   }

//   @override
//   int get hashCode => message.hashCode;
// }
