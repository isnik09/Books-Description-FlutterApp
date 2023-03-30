import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_books_app/components/colors.dart';
import 'package:mvvm_books_app/components/wide_button.dart';
import 'package:mvvm_books_app/utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // IMAGE
              Image.asset(
                'assets/splash.png',
                width: double.infinity,
              ),
              // GREETING TEXT
              const Text(
                "Hello there!\nHappy reading",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              // SIZED BOX
              const SizedBox(
                height: 20,
              ),
              // LET'S GO BUTTON
              WideButton(
                  onTapFunction: () {
                    Navigator.pushNamed(context, RoutesName.home);
                  },
                  buttonTitle: "Let's go",
                  buttonIcon: CupertinoIcons.arrow_right),
              // SIZED BOX
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
