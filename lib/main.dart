import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/locator.dart';
import 'package:food_delivery/common/service_call.dart';
import 'package:food_delivery/view/home/home_view.dart';
import 'package:food_delivery/view/login/welcome_view.dart';
import 'package:food_delivery/view/main_tabview/main_tabview.dart';
import 'package:food_delivery/view/more/my_order_provider.dart';
import 'package:food_delivery/view/more/provider_payment_details.dart';
import 'package:food_delivery/view/on_boarding/startup_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'common/globs.dart';
import 'common/my_http_overrides.dart';
import 'package:easy_localization/easy_localization.dart';

SharedPreferences? prefs;
void main() async {
  setUpLocator();
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();

  runApp(EasyLocalization(
      supportedLocales: [
        Locale(
          'en',
        ),
        Locale(
          'ar',
        )
      ],
      path: 'assets/languages',
      fallbackLocale: Locale('ar'),
      child: MyApp(
        defaultHome: WelcomeView(),
      )));
}

class MyApp extends StatefulWidget {
  final Widget defaultHome;
  const MyApp({super.key, required this.defaultHome});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => UserDataProviderContractor()),
        ChangeNotifierProvider(create: (_) => CardDataProvider()),
        ChangeNotifierProvider(create: (_) => MyOrderDataProvider()),
      ],
      child: MaterialApp(
        title: 'Food Delivery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Metropolis",

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: widget.defaultHome,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case "welcome":
              return MaterialPageRoute(
                  builder: (context) => const WelcomeView());
            case "Home":
              return MaterialPageRoute(
                  builder: (context) => const MainTabView());
            default:
              return MaterialPageRoute(
                  builder: (context) => Scaffold(
                        body: Center(
                            child: Text("No path for ${routeSettings.name}")),
                      ));
          }
        },
        builder: (context, child) {
          return FlutterEasyLoading(child: child);
        },
      ),
    );
  }
}
