import 'package:ecokart_app/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import '/utils/app_theme.dart';
import '/providers/login_provider.dart';
import '/routes/routes.dart';
import '/screens/signup_screen.dart';
import '/logic/user_cubit.dart';
import '/logic/user_state.dart';
import '/screens/splash_screen.dart';

import '/widgets/primary_button.dart';
import '/widgets/primary_textfield.dart';
import '/widgets/link_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = "login";


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if(state is UserLoggedInState) {
            Navigator.pushReplacementNamed(context, SplashScreen.routeName);
          }
        },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
            elevation: 0,
            title: const Text(
                "EcoKart",
            ),

        ),
        body: SafeArea(
          child: Form(
            key: provider.formKey,
            child: ListView(
                padding: const EdgeInsets.all(16),
                children: [

                  Text("Welcome Back", style: TextStyles.heading2),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Hello there, login to continue.",
                      style: TextStyles.body2
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  (provider.error != "") ?
                  Text( provider.error,
                    style: TextStyle(color: Colors.red),
                  ) : const SizedBox(),

                  SizedBox(
                    height: 25,
                  ),

                  PrimaryTextField(
                      controller: provider.emailController,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Email address is required!";
                        }

                        if(!EmailValidator.validate(value.trim())) {
                          return "Invalid email address";
                        }

                        return null;
                      },
                      labelText: "Email Address"
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  PrimaryTextField(
                      controller: provider.passwordController,
                      obscureText: true,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Password is required!";
                        }
                        return null;
                      },
                      labelText: "Password"
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LinkButton(
                          onPressed: () {},
                          text: "Forgot Password?"
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  PrimaryButton(
                      onPressed: provider.logIn,
                      text: (provider.isLoading) ? "..." : "Log In"
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Don't have an account? ", style: TextStyles.body2),

                      SizedBox(
                        height: 20,
                      ),

                      LinkButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignupScreen.routeName);
                          },
                          text: "Sign Up"
                      )

                    ],
                  ),

                ]
            ),
          ),
        ),
      ),
    );
  }
}
