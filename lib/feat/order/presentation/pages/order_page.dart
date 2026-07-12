import 'package:flutter/material.dart';
import 'package:hungey/feat/shared/custem_text.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  static const String orderRoute = "/order";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustemText(text: "Orders", fontsize: 24, color: Colors.black),
        ),
      ),
    );
  }
}