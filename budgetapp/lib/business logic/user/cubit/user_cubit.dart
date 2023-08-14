import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.userRepository}) : super(UserInitial());
  final UserRepository userRepository;

  void registerUser(String name, String email, String password) async {
    emit(UserRegistrationLoading());

    try {
      bool registrationSuccess = await userRepository.userRegistration(
        name: name,
        email: email,
        password: password,
      );

      if (registrationSuccess) {
        emit(UserRegistrationSuccess());
      } else {
        emit(UserRegistrationFailure());
      }
    } catch (error) {
      emit(UserRegistrationError());
    }
  }
}
