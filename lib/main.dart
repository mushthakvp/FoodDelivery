import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/view/home_screen.dart';
import 'package:food_delivery/home_screen/viewmodel/carousel_image_pov.dart';
import 'package:food_delivery/home_screen/viewmodel/home_pov.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/search/viewmodel/search_pov.dart';
import 'package:food_delivery/sign_screen/viewmodel/auth_pov.dart';
import 'package:food_delivery/splash_screen/viewmodel/splash_pov.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashPov>(create: (context) => SplashPov()),
        ChangeNotifierProvider<AuthPov>(create: (context) => AuthPov(FirebaseAuth.instance)),
        ChangeNotifierProvider<HomePov>(create: (context) => HomePov()),
        ChangeNotifierProvider<SearchScreenPov>(create: (context) => SearchScreenPov()),
        ChangeNotifierProvider<HomeCarouselPov>(create: (context) => HomeCarouselPov()),
      ],
      child: MaterialApp(
        navigatorKey: Routes.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const HomeScreen(),
      ),
    );
  }
}
