// locale_service.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleService extends GetxService {
  static LocaleService get to => Get.find();

  final _localeStorage = GetStorage();
  RxString _currentLocale = "".obs;

  String get currentLocale => _currentLocale.value;

  @override
  Future<void> onInit() async {
    await _initLocale();
    super.onInit();
  }

  Future<void> _initLocale() async {
    String? savedLocale = _localeStorage.read('locale');
    if (savedLocale != null && savedLocale.isNotEmpty) {
      _currentLocale.value = savedLocale;
    } else {
      _currentLocale.value = 'en'; // Default language is English
    }
  }

  void updateLocale(String locale) {
    _currentLocale.value = locale;
    _localeStorage.write('locale', locale);
    Get.updateLocale(Locale(locale));
  }

  Locale getLocale() {
    switch (currentLocale) {
      case 'en':
        return Locale('en', 'US');
      case 'es':
        return Locale('es', 'ES');
      // Add more locales as needed
      default:
        return Locale('en', 'US');
    }
  }

  static String getFlag(String locale) {
    switch (locale) {
      case 'en':
        return '🇺🇸';
      case 'es':
        return '🇪🇸';
      // Add more flags as needed
      default:
        return '';
    }
  }
}
