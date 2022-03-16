

import 'package:e_commerce/localization/ar.dart';
import 'package:e_commerce/localization/en.dart';
import 'package:e_commerce/localization/fr.dart';
import 'package:e_commerce/utils/strings.dart';
import 'package:get/get.dart';

class LocalizationApp extends Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    ene : en,
    ara : ar,
    frn : fr,
  };

}