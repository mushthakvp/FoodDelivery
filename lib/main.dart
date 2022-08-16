import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/provider/providers.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/splash_screen/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Providers.providers());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Routes.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const SplashScreen(),
    );
  }
}
