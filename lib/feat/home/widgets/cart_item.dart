import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/feat/shared/custem_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.text,
    required this.image,
    required this.desc,
    required this.rate,
  });

  final String text;
  final String image;
  final String desc;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 200,
      child: Card(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  image,
                  width: 110,
                  height: 85,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 12),

              CustemText(
                text: text,
                color: Colors.black,
                fontsize: 16,
                fontweight: FontWeight.bold,
              ),

              const SizedBox(height: 4),

              CustemText(
                text: desc,
                color: Colors.grey,
                fontsize: 14,
                fontweight: FontWeight.w500,
              ),

              Spacer(),

              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),

                  const SizedBox(width: 4),

                  CustemText(
                    text: rate,
                    color: Colors.black,
                    fontsize: 16,
                    fontweight: FontWeight.w600,
                  ),

                  const Spacer(),

                  Icon(
                    CupertinoIcons.heart_fill,
                    color: AppColor.primary,
                    size: 20,
                  ),
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
