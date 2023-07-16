import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/utils/app_theme.dart';
import '/logic/user_cubit.dart';
import '/logic/category_cubit.dart';
import '/logic/product_cubit.dart';
import '/logic/cart_cubit.dart';
import '/routes/routes.dart';

import '/screens/login_screen.dart';
import '/screens/category_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => ProductCubit()),

        BlocProvider(create: (context) => CartCubit(
            BlocProvider.of<UserCubit>(context)
        )),

        // BlocProvider(create: (context) => OrderCubit(
        //   BlocProvider.of<UserCubit>(context),
        //   BlocProvider.of<CartCubit>(context),
        // )),

      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.defaultTheme,
          onGenerateRoute: Routes.onGenerateRoute,
          initialRoute: LoginScreen.routeName
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase bloc) {
    log("Created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in $bloc: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    super.onClose(bloc);
  }
}
