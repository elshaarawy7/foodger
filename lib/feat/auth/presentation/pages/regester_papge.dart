import 'package:flutter/material.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/feat/auth/presentation/widgets/regester_page_body.dart';

class RegesterPapge extends StatelessWidget {
  const RegesterPapge({super.key});

static const String regesterRoute = '/regester';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary, 
      body:RegisterPageBody() ,
    );
  }
}