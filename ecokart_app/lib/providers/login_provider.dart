import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import '/logic/user_cubit.dart';
import '/logic/user_state.dart';

//handle states related to login

class LoginProvider with ChangeNotifier {
  final BuildContext context;

  LoginProvider(this.context) {
    _listenToUserCubit();
  }

  bool isLoading = false;
  String error = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  StreamSubscription? _userSubscription;

  void _listenToUserCubit() {
    _userSubscription = BlocProvider.of<UserCubit>(context).stream.listen((userState) {
      if(userState is UserLoadingState) {
        isLoading = true;
        error = "";
        notifyListeners();
      }
      else if(userState is UserErrorState) {
        isLoading = false;
        error = userState.message;
        notifyListeners();
      }
      else {
        isLoading = false;
        error = "";
        notifyListeners();
      }
    });
  }

  //1. access bloc in this using context
  void logIn() async {
    if(!formKey.currentState!.validate()) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    //add bloc event(cubit) to change/emit state
    BlocProvider.of<UserCubit>(context).signIn(email: email, password: password);
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }
}
