import 'package:flutter/material.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/feat/auth/presentation/widgets/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String loginRoute = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColor.secondary, body: LoginPageBody());
  }
}
