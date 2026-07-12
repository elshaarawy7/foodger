import 'package:flutter/material.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/feat/shared/custem_text.dart';

class CustemBatton extends StatelessWidget {
  const CustemBatton({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.secondary,
        ),
        child: Center(
          child: CustemText(
            text: text,
            color: AppColor.primary,
            fontsize: 20,
            fontweight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
