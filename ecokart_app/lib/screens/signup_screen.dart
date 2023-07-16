import 'package:ecokart_app/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

import '/utils/app_theme.dart';
import '/providers/signup_provider.dart';

import '/widgets/primary_button.dart';
import '/widgets/primary_textfield.dart';
import '/widgets/link_button.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String routeName = "signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: const Text("Ecokart")
      ),
      body: SafeArea(
        child: Form(
          key: provider.formKey,
          child: ListView(
              padding: const EdgeInsets.all(16),
              children: [

                Text("Create Account", style: TextStyles.heading2),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Hello there, register to continue.",
                    style: TextStyles.body2
                ),
                SizedBox(
                  height: 15,
                ),
                (provider.error != "") ? Text(
                  provider.error,
                  style: const TextStyle(color: Colors.red),
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

                SizedBox(
                  height: 20,
                ),

                PrimaryTextField(
                    controller: provider.cPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if(value == null || value.trim().isEmpty) {
                        return "Confirm your password!";
                      }

                      if(value.trim() != provider.passwordController.text.trim()) {
                        return "Passwords do not match!";
                      }

                      return null;
                    },
                    labelText: "Confirm Password"
                ),

                SizedBox(
                  height: 20,
                ),

                PrimaryButton(
                    onPressed: provider.createAccount,
                    text: (provider.isLoading) ? "..." : "Create Account"
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Already have an account? ", style: TextStyles.body2),

                    SizedBox(
                      height: 20,
                    ),

                    LinkButton(
                        onPressed: () {},
                        text: "Log In"
                    )

                  ],
                ),

              ]
          ),
        ),
      ),
    );
  }
}
