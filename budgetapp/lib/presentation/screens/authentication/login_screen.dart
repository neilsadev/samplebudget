import 'package:budgetapp/presentation/screens/authentication/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business logic/user/cubit/user_cubit.dart';
import '../../../data/repositories/user_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (context) => UserCubit(
            userRepository: context.read<UserRepository>(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login Screen",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form validation successful, handle submission
                    // You can access the input values using _nameController.text, _emailController.text, _passwordController.text
                  }
                },
                color: Colors.black,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                      (route) => false);
                },
                child: const Text('Or register Here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
