import 'package:budgetapp/presentation/screens/authentication/registration_screen.dart';
import 'package:flutter/material.dart';

class InitialNavigationScreen extends StatefulWidget {
  const InitialNavigationScreen({super.key});

  @override
  State<InitialNavigationScreen> createState() =>
      _InitialNavigationScreenState();
}

class _InitialNavigationScreenState extends State<InitialNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return RegistrationScreen();
  }
}
