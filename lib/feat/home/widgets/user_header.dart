import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/core/constant/app_images.dart';
import 'package:hungey/feat/shared/custem_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppImages.logo,
              color: AppColor.primary,
              height: 30,
            ),

            Gap(5),

            CustemText(
              text: " Hello , Elshaarawy",
              color: Colors.grey.shade500,
              fontsize: 20,
              fontweight: FontWeight.w500,
            ),
          ],
        ),
        Spacer(),

        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(AppImages.profileIm),
        ),
      ],
    );
  }
}
