import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/feat/shared/custem_text.dart';


class FoodCatogry extends StatefulWidget {
  FoodCatogry({super.key, required this.catogry , required this.selectedIndex}); 

   final  int  selectedIndex ; 

  final List catogry  ;

  @override
  State<FoodCatogry> createState() => _FoodCatogryState();
}

class _FoodCatogryState extends State<FoodCatogry> {  

  late int  selectedIndex  ; 

  void initState(){
    selectedIndex = widget.selectedIndex ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(widget.catogry.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                       selectedIndex = index ;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:selectedIndex == index
                                  ? AppColor.primary
                                  : AppColor.secondary,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 27,
                              vertical: 18,
                            ),
                            child: CustemText(
                              text:widget.catogry[index],
                              color:selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontsize: 16,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                    ),
                  );
  }
}