part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserFetching extends UserState {}

final class UserFetchingSuccess extends UserState {}

final class UserFetchingError extends UserState {}
