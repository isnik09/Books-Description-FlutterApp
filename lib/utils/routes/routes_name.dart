import 'package:flutter/material.dart';
import 'package:mvvm_books_app/utils/routes/routes.dart';
import 'package:mvvm_books_app/view/book_desc_screen.dart';
import 'package:mvvm_books_app/view/home_screen.dart';
import 'package:mvvm_books_app/view/splash_screen.dart';

// HERE WE DEFINED ROUTES FOR THE NAVIGATION

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case RoutesName.book_desc:
        return MaterialPageRoute(
            builder: (BuildContext context) => BookDescView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
              body: Center(
            child: Text("No route defined"),
          ));
        });
    }
  }
}
