import 'package:flutter/material.dart';
import 'package:hungey/core/helper/app_router.dart';
import 'package:hungey/feat/splash/presentation/pages/splash_page.dart';

void main() {
  runApp(const HungryApp());
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
