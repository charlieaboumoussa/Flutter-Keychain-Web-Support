part of authentication_bloc;

abstract class AuthenticationEvent extends Equatable{
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthenticationEvent {}

//class LoggedIn extends AuthenticationEvent {
//  final Map<String,dynamic> token;
//
//  const LoggedIn({@required this.token});
//
//  @override
//  List<Object> get props => [token];
//
//  @override
//  String toString() => 'LoggedIn { token: $token }';
//}
//
//class SignUpEvent extends AuthenticationEvent {
//  final Map<String, dynamic> token;
//
//  const SignUpEvent({@required this.token});
//
//  @override
//  List<Object> get props => [token];
//
//  @override
//  String toString() => 'LoggedIn { token: $token }';
//}

class LoggedOutEvent extends AuthenticationEvent {}