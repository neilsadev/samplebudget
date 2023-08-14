part of 'user_cubit.dart';

@immutable
sealed class UserState {}

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

final class UserInitial extends UserState {}

final class UserFetching extends UserState {
  //TODO: SET USER TO NULL
}

final class UserFetchingSuccess extends UserState {
  //TODO: SAVE USER OBJECT SOMEWHERE
}

final class UserFetchingError extends UserState {
  //TODO: EMIT ERROR SOMEHOW
}

class UserRegisterRequested extends UserEvent {
  final String name;
  final String email;
  final String password;

  const UserRegisterRequested({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}

final class UserRegistrationLoading extends UserState {
  //TODO: Registration Screen loading
}

final class UserRegistrationSuccess extends UserState {
  //TODO: Registration Screen success
}

final class UserRegistrationFailure extends UserState {
  //TODO: Registration Screen final
}

final class UserRegistrationError extends UserState {
//TODO: Registration Screen final
}
