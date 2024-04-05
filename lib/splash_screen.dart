import 'package:codeland/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // Adjust delay as needed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginScreen()), // Your target page
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          backgroundColor: const Color(0xffF5862A),
          body: Center(
              child: Container(
                  width: 50.w,
                  height: 65.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(4, 4),
                          blurRadius: 2.w,
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Image.asset("assets/images/logo.png"),
                  ))));
    });
  }
}
