import 'package:flutter/material.dart';
import 'package:hungey/feat/shared/custem_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustemText(text: "Cart", fontsize: 24, color: Colors.black),
        ),
      ),
    );
  }
}