import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungey/core/constant/app_images.dart';
import 'package:hungey/feat/home/widgets/cart_item.dart';
import 'package:hungey/feat/home/widgets/food_catogrey.dart';
import 'package:hungey/feat/home/widgets/searsh_bar.dart';
import 'package:hungey/feat/home/widgets/user_header.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int selectedIndex = 0;
  List catogry = ['All', 'Combos', 'Sliders', 'clasic'];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Gap(50)),

            // header
            SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              pinned: true,
              floating: false,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              toolbarHeight: 130,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(children: [UserHeader(), Gap(5), SearchBarr()]),
              ),
            ),

            // catogry
            SliverToBoxAdapter(
              child: FoodCatogry(
                catogry: catogry,
                selectedIndex: selectedIndex,
              ),
            ),

            // items
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.6,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CartItem(
                    text: "Classic Burger",
                    image: AppImages.burger,
                    desc: "A classic burger",
                    rate: "4.5",
                  );
                }, childCount: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
