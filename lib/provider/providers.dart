import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../favourite_screen/viewmodel/favourite_pov.dart';
import '../home_screen/viewmodel/bottom_barprovider.dart';
import '../home_screen/viewmodel/carousel_image_pov.dart';
import '../home_screen/viewmodel/home_pov.dart';
import '../main.dart';
import '../product_overview_screen/viewmodel/addon_provider.dart';
import '../sign_screen/viewmodel/auth_pov.dart';
import '../splash_screen/viewmodel/splash_pov.dart';
import '../view_all_screen/viewmodel/view_provider.dart';
import '../view_all_screen/viewmodel/viewmodel_provider.dart';

class Providers {
  static Widget providers() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashPov>(create: (context) => SplashPov()),
        ChangeNotifierProvider<AuthPov>(create: (context) => AuthPov(FirebaseAuth.instance)),
        ChangeNotifierProvider<HomePov>(create: (context) => HomePov()),
        ChangeNotifierProvider<HomeCarouselPov>(create: (context) => HomeCarouselPov()),
        ChangeNotifierProvider<AddOnProductPov>(create: (context) => AddOnProductPov()),
        ChangeNotifierProvider<FavouritePov>(create: (context) => FavouritePov()),
        ChangeNotifierProvider<ViewAllPov>(create: (context) => ViewAllPov()),
        ChangeNotifierProvider<ViewAllModelPov>(create: (context) => ViewAllModelPov()),
        ChangeNotifierProvider<HomeBottomNavBar>(create: (context) => HomeBottomNavBar()),
      ],
      child: const MyApp(),
    );
  }
}
