import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  MobileAds.instance.initialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'Islamic Learning App',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
