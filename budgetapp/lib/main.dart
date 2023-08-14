import 'package:budgetapp/business%20logic/budget/cubit/budget_cubit.dart';
import 'package:budgetapp/business%20logic/user/cubit/user_cubit.dart';
import 'package:budgetapp/data/repositories/user_repository.dart';
import 'package:budgetapp/presentation/initial_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
            create: (context) => UserCubit(userRepository: userRepository)),
        BlocProvider<BudgetCubit>(create: (context) => BudgetCubit()),
      ],
      child: MaterialApp(
        title: 'BloC Budget App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const InitialNavigationScreen(),
      ),
    );
  }
}
