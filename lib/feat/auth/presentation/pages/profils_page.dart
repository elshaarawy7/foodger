import 'package:flutter/material.dart';
import 'package:hungey/feat/shared/custem_text.dart';

class ProfilsPage extends StatelessWidget {
  const ProfilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustemText(text: "Profils", fontsize: 24, color: Colors.black),
        ),
      ),
    );
  }
}