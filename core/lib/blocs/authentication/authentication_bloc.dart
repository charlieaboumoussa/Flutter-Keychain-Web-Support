library authentication_bloc;

import 'package:bloc/bloc.dart';
import 'package:core/blocs/base_state.dart';
import 'package:core/resources/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, BaseState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required userRepository})
      : assert(userRepository != null), _userRepository = userRepository;

  @override
  BaseState get initialState => InitialState();

  @override
  Stream<BaseState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStartedEvent) {
      yield LoadingState();
      await Future.delayed(const Duration(seconds: 3), () {});
      bool _hasToken = false;
      await _userRepository.hasToken().then((hasToken) {
        _hasToken = hasToken;
      });
      if (_hasToken) {
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    }

//    if(event is LoggedIn){
//      yield LoadingState();
//      await _userRepository.persistToken(event.token);
//      yield AuthenticationAuthenticatedState();
//    }

//    if(event is SignUpEvent){
//      yield LoadingState();
//      await _userRepository.persistToken(event.token);
//      yield AuthenticatedState();
//    }

    if(event is LoggedOutEvent){
      yield LoadingState();
      await _userRepository.deleteToken();
      yield UnauthenticatedState();
    }
  }
}
