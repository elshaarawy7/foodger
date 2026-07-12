import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/core/constant/app_images.dart';
import 'package:hungey/core/helper/validators.dart';
import 'package:hungey/feat/auth/presentation/widgets/custem_textfromfiled.dart';
import 'package:hungey/feat/home/home_page.dart';
import 'package:hungey/feat/shared/custem_batton.dart';
import 'package:hungey/feat/shared/custem_text.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const Gap(70),

              SvgPicture.asset(
                AppImages.logo,
                width: 50,
                height: 50,
                color: AppColor.primary,
              ),

              const Gap(20),

              CustemText(text: "Create Account", color: AppColor.primary),

              const Gap(20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    CustomTextFormFiled(
                      hintText: "Full Name",
                      prefixIcon: Icons.person_outline,
                      controller: nameController,
                      validator: AppValidators.name,
                    ),

                    const Gap(20),

                    CustomTextFormFiled(
                      hintText: "Email",
                      prefixIcon: Icons.email_outlined,
                      controller: emailController,
                      validator: AppValidators.email,
                    ),

                    const Gap(20),

                    CustomTextFormFiled(
                      hintText: "Phone",
                      prefixIcon: Icons.phone_outlined,
                      controller: phoneController,
                      validator: AppValidators.phone,
                    ),

                    const Gap(20),

                    CustomTextFormFiled(
                      hintText: "Password",
                      prefixIcon: Icons.lock_outline,
                      controller: passwordController,
                      isPassword: true,
                      validator: AppValidators.password,
                    ),

                    const Gap(20),

                    CustomTextFormFiled(
                      hintText: "Confirm Password",
                      prefixIcon: Icons.lock_outline,
                      controller: confirmPasswordController,
                      isPassword: true,
                      validator: AppValidators.password,
                    ),

                    const Gap(30),

                    CustemBatton(
                      text: "Register",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.go(HomePage.homeRoute);
                        }
                      },
                    ),

                    const Gap(20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustemText(
                          text: "Already have an account?",
                          color: AppColor.secondary,
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: CustemText(
                            text: "Login",
                            color: AppColor.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
