import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarr extends StatelessWidget {
  const SearchBarr({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      shadowColor: Colors.grey,
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
         
          hintText: 'search...',
          hintStyle: TextStyle(color: Colors.black),
          prefix: Icon(CupertinoIcons.search),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}