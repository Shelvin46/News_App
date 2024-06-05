import 'package:equatable/equatable.dart';

///[BaseState] is the base class for all the states in the application.
///It extends [Equatable] to make the states comparable.
///[SuccessState] is the state that is emitted when the operation is successful.
///[NoInternetState] is the state that is emitted when there is no internet connection.
///[TimeoutErrorState] is the state that is emitted when the operation times out.
///[FormatExceptionState] is the state that is emitted when there is a format exception.
///[ParsingErrorState] is the state that is emitted when there is a parsing error.
///[ServerErrorState] is the state that is emitted when there is a server error.
///All the states extend [BaseState].

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

class LoadingState extends BaseState {
  @override
  List<Object> get props => [];
}

class SuccessState extends BaseState {
  const SuccessState();
  @override
  List<Object> get props => [];
}

class NoInternetState extends BaseState {
  const NoInternetState();

  @override
  List<Object> get props => [];
}

class TimeoutErrorState extends BaseState {
  const TimeoutErrorState();

  @override
  List<Object> get props => [];
}

class FormatExceptionState extends BaseState {
  const FormatExceptionState();

  @override
  List<Object> get props => [];
}

class ParsingErrorState extends BaseState {
  const ParsingErrorState();

  @override
  List<Object> get props => [];
}

class ServerErrorState extends BaseState {
  const ServerErrorState();

  @override
  List<Object> get props => [];
}
