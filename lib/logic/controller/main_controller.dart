

import 'package:e_commerce/view/screens/category_screen.dart';
import 'package:e_commerce/view/screens/favorite_screen.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:e_commerce/view/screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController{

  RxInt currentIndex = 0.obs;

   final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

   final title = [
     'Zara Shop'.tr,
     'Categories'.tr,
     'Favorites'.tr,
     'Settings'.tr,
   ].obs;

}