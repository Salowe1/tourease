// language_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/services/locale_service.dart';

class LanguagePage extends StatelessWidget {
  
  final LocaleService localeService = Get.find(); // Get instance of LocaleService
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 242, 242, 242),
        title: Text('Language'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLanguageItem('English', 'en'),
          _buildLanguageItem('Spanish', 'es'),
          // Add more languages as needed
        ],
      ),
    );
  }

  Widget _buildLanguageItem(String languageName, String locale) {
    return ListTile(
      title: Text(languageName),
      onTap: () {
        localeService.updateLocale(locale); // Update app's locale using LocaleService
        Get.back(); // Close language page and return to previous screen
      },
    );
  }
}
