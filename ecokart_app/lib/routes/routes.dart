import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '/screens/login_screen.dart';
import '/screens/signup_screen.dart';
import '/screens/home_screen.dart';
import '/screens/splash_screen.dart';
import '/screens/product_details_screen.dart';

import '/providers/login_provider.dart';
import '/providers/signup_provider.dart';

import '/models/product.dart';

class Routes {

  static Route? onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {

      case LoginScreen.routeName: return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => LoginProvider(context),
              child: const LoginScreen()
          )
      );

      case SignupScreen.routeName: return CupertinoPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => SignupProvider(context),
              child: const SignupScreen()
          )
      );

      case HomeScreen.routeName: return CupertinoPageRoute(
          builder: (context) => const HomeScreen()
      );
      //

      case SplashScreen.routeName: return CupertinoPageRoute(
          builder: (context) => const SplashScreen()
      );

      case ProductDetailsScreen.routeName: return CupertinoPageRoute(
          builder: (context) => ProductDetailsScreen(
            productModel: settings.arguments as ProductModel,
          )
      );
      //
      // case CartScreen.routeName: return CupertinoPageRoute(
      //     builder: (context) => const CartScreen()
      // );
      //
      // case CategoryProductScreen.routeName: return CupertinoPageRoute(
      //     builder: (context) => BlocProvider(
      //         create: (context) => CategoryProductCubit(settings.arguments as CategoryModel),
      //         child: const CategoryProductScreen()
      //     )
      // );
      //
      // case EditProfileScreen.routeName: return CupertinoPageRoute(
      //     builder: (context) => const EditProfileScreen()
      // );
      //
      // case OrderDetailScreen.routeName: return CupertinoPageRoute(
      //     builder: (context) => ChangeNotifierProvider(
      //         create: (context) => OrderDetailProvider(),
      //         child: const OrderDetailScreen()
      //     )
      // );
      //
      // case OrderPlacedScreen.routeName: return CupertinoPageRoute(
      //     builder: (context) => const OrderPlacedScreen()
      // );
      //
      // case MyOrderScreen.routeName: return CupertinoPageRoute(
      //     builder: (context) => const MyOrderScreen()
      // );

      default: return null;

    }
  }

}
