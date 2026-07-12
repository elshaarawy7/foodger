import 'package:flutter/material.dart';
import 'package:hungey/feat/splash/presentation/widgets/splah_page_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key}); 

  static const String routeName = "/splash"; 

  @override
  Widget build(BuildContext context) {
    return SplashPageBody();
  }
}
