import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_getx/app/data/services/storage/services.dart';
import 'package:todo_app_getx/app/modules/home/binding.dart';
import 'package:todo_app_getx/app/modules/home/view.dart';
import 'themes/theme_controller.dart';
import 'lang/translations.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.lightTheme,
        darkTheme: themeController.darkTheme,
        themeMode:
            themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        home: const HomePage(),
        initialBinding: HomeBinding(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en', 'US'),
        translations: AppTranslations(),
        builder: EasyLoading.init(),
      );
    });
  }
}
