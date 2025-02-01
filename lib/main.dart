import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_color_generator/material_color_generator.dart';

import '../routes/get_page_route.dart';
import '../routes/routes_names.dart';
import '../services/settings_service.dart';

void main() async {
  Get.log('Starting services...');
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('transactions');
  await Hive.openBox('categories');
  await Get.putAsync(() => SettingsService().init());
  Get.log('All services started...');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: const Color(0XFFB80099),
      ),
    );
    return GetMaterialApp(
      title: 'FlowCash',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      locale: Get.deviceLocale,
      getPages: GetPagesRoute.pages,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          color: const Color(0XFFB80099),
        ),
      ),
      initialRoute: RoutesNames.splashScreenPage,
      unknownRoute: GetPagesRoute.pages[0],
    );
  }
}
