import 'package:allevents/bindings/controller_binding.dart';
import 'package:allevents/ui/Authentication%20Screen/View/authentication_screen.dart';
import 'package:allevents/ui/Category%20Screen/View/category_screen.dart';
import 'package:allevents/utils/shared_preference.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
var uid;

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  uid = prefs?.getString('keyUID');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('VALUE ${prefs?.getString('keyUID').toString()}');
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'All Events',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: ControllerBinding(),
        home: uid == null ? AuthenticationScreen() : CategoryScreen()
        // prefs?.getString('keyUID').toString() == null ? AuthenticationScreen() : CategoryScreen(),
        );
  }
}
