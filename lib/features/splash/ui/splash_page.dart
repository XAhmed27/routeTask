import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:routetask/config/routes/app_routes.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.ProductListScreen);

    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 50.w,
          child:Image.asset(
            "assets/logo.jpg"
          ) ,
        ),
      ),
    );
  }
}
