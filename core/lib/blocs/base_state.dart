import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable{
  const BaseState();

  @override
  List<Object> get props =>[];
}


class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class ErrorState extends BaseState {

  String error;

  ErrorState({this.error});

  @override
  List<Object> get props => [error];
}