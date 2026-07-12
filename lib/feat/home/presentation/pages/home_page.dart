import 'package:flutter/material.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/feat/home/widgets/home_view_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}); 

  static const String homeRoute = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary, 
      body: HomeViewBody(),
    );
  }
}