import 'package:e_commerce/localization/en.dart';
import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/strings.dart';
import 'package:e_commerce/utils/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'localization/localization_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      locale: Locale(GetStorage().read<String>('lang').toString(),),
      translations: LocalizationApp(),
      fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      themeMode: ThemeController().themeDataGet,
      darkTheme: ThemesApp.dark,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? Routes.mainScreen
          : Routes.welcomeScreen,
      getPages: AppRoutes.routes,
    );
  }
}
