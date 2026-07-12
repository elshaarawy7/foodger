import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/core/constant/app_images.dart';
import 'package:hungey/core/helper/validators.dart';
import 'package:hungey/feat/auth/presentation/pages/regester_papge.dart';
import 'package:hungey/feat/auth/presentation/widgets/custem_textfromfiled.dart';
import 'package:hungey/feat/home/home_page.dart';
import 'package:hungey/feat/shared/custem_batton.dart';
import 'package:hungey/feat/shared/custem_text.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final AutovalidateMode autoValidateMode = AutovalidateMode.always;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                Gap(100),
                SvgPicture.asset(
                  AppImages.logo,
                  color: AppColor.primary,
                  width: 50,
                  height: 50,
                ),
                Gap(20),
                CustemText(text: "Welcome Back", color: AppColor.primary),
                Gap(20),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),

                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Gap(20),
                        CustomTextFormFiled(
                          hintText: "Email",
                          prefixIcon: Icons.email,
                          controller: emailController,
                          validator: AppValidators.email,
                        ),
                        Gap(20),
                        CustomTextFormFiled(
                          hintText: "Password",
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          controller: passwordController,
                          validator: AppValidators.requiredField,
                        ),

                        Gap(20),
                        CustemBatton(
                          text: "Login",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.push(HomePage.homeRoute);
                            }
                          },
                        ),

                        Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustemText(
                              text: "Don't have an account?",
                              color: AppColor.secondary,
                            ),
                            TextButton(
                              onPressed: () {
                                context.go(RegesterPapge.regesterRoute);
                              },
                              child: CustemText(
                                text: "Register",
                                color: AppColor.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
