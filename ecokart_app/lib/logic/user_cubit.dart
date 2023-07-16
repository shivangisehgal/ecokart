import 'package:flutter_bloc/flutter_bloc.dart';

import '/models/user.dart';
import '/repositories/user_repo.dart';
import '/logic/user_state.dart';
import '/services/preferences.dart';

//list all events

class UserCubit extends Cubit<UserState> {
  UserCubit() : super( UserInitialState() ) {
    _initialize();
  }

  final UserRepository _userRepository = UserRepository(); //we need to make available the data from the network layerr, for the presentation layer

  void _initialize() async {
    final userDetails = await Preferences.fetchUserDetails();
    String? email = userDetails["email"];
    String? password = userDetails["password"];

    if(email == null || password == null) {
      emit( UserLoggedOutState() );
    }
    else {
      signIn(email: email, password: password);
    }
  }

  void _emitLoggedInState({
    required UserModel userModel,
    required String email,
    required String password
  }) async {
    await Preferences.saveUserDetails(email, password);
    emit( UserLoggedInState(userModel) );
  }

  //1. sign in
  void signIn({
    required String email,
    required String password
  }) async {

    //initially, user will be loaded -> just for logic representation, has nothing

    emit( UserLoadingState() );

    try {
      //sign in user
      UserModel userModel = await _userRepository.signIn(email: email, password: password);

      //emit UserLoggedInState(userModel)
      _emitLoggedInState(userModel: userModel, email: email, password: password);
    }
    catch(ex) {
      emit( UserErrorState(ex.toString()) );
    }
  }

  //2. create account
  void createAccount({
    required String email,
    required String password
  }) async {

    //initially, user will be loaded -> just for logic representation, has nothing

    emit( UserLoadingState() );

    try {
      UserModel userModel = await _userRepository.createAccount(email: email, password: password);

      //emit UserLoggedInState(userModel)
      _emitLoggedInState(userModel: userModel, email: email, password: password);
    }
    catch(ex) {
      emit( UserErrorState(ex.toString()) );
    }
  }

  //3. Update User
  Future<bool> updateUser(UserModel userModel) async {
    emit( UserLoadingState() );
    try {
      UserModel updatedUser = await _userRepository.updateUser(userModel);
      emit( UserLoggedInState(updatedUser) );
      return true;
    }
    catch(ex) {
      emit( UserErrorState(ex.toString()) );
      return false;
    }
  }

  //4. Sign User Out
  void signOut() async {
    await Preferences.clear();
    emit( UserLoggedOutState() );
  }
}
