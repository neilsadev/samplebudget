part of 'user_cubit.dart';

@immutable
sealed class UserState {}

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
