// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_c, depend_on_referenced_packages, avoid_print, must_be_immutable

import 'dart:async';
import 'package:base_architecture_project/mvvm/view_model/controller/language/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'mvvm/view_model/localization/localization_service.dart';
import 'mvvm/view_model/utils/color/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()));
}

Future<void> initializeApp() async {

  /// ScreenUtils
  ScreenUtil.ensureScreenSize();

  /// Language Controller
  final languageController = LanguageController();
  languageController.initializeLocale();
  Get.put(languageController);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: ColorsTheme.transparent,statusBarIconBrightness: Brightness.dark));
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: GetMaterialApp(
            title: "Base Project",
            color: ColorsTheme.primaryColor,
            translations: LocalizationService(),
            locale: Locale(Get.find<LanguageController>().selectedLocale.value),
            fallbackLocale: Locale('en', 'US'),
            textDirection: TextDirection.ltr,
            defaultTransition: Transition.fadeIn,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'OpenSansRegular',
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: ColorsTheme.primaryColor,
                secondary: ColorsTheme.primaryColor,
              ),
            ),
            home: Scaffold(body: Container(color: Colors.orange,)),
          ),
        );
      },
    );
  }
}