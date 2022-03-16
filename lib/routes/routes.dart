import 'package:e_commerce/logic/binding/product_binding.dart';
import 'package:e_commerce/view/screens/auth/forgot_password_screen.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:e_commerce/view/screens/auth/signup_screen.dart';
import 'package:e_commerce/view/screens/main_screen.dart';
import 'package:e_commerce/view/screens/payment_screen.dart';
import 'package:e_commerce/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

import '../logic/binding/auth_binding.dart';
import '../logic/binding/main_binding.dart';
import '../view/screens/cart_screen.dart';

class AppRoutes {
  //initial Routes
  static const String welcome = Routes.welcomeScreen;
  static const String main = Routes.mainScreen;

  //get pages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () =>  LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () =>  SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () =>  ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () =>  CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () =>  PaymentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
      ],
    ),
  ];
}

class Routes {
  static const String welcomeScreen = '/welcomeScreen';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String mainScreen = '/mainScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String cartScreen = '/cartScreen';
  static const String paymentScreen = '/paymentScreen';
}
