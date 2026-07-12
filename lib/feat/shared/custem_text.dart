import 'package:flutter/material.dart';

class CustemText extends StatelessWidget {
  const CustemText({
    super.key, 
    required this.text,
    required this.color, 
    this.fontsize, 
    this.fontweight , 
  }); 

  final String text ; 
  final Color color ; 
  final double? fontsize ; 
  final FontWeight? fontweight ; 


  @override
  Widget build(BuildContext context) {
    return  Text(text , style: TextStyle(
      color: color , 
      fontSize: fontsize , 
      fontWeight: fontweight
      )) ;
  }
}