import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hungey/feat/auth/presentation/pages/login_page.dart';
import 'package:hungey/feat/auth/presentation/pages/regester_papge.dart';
import 'package:hungey/feat/home/presentation/pages/home_page.dart';
import 'package:hungey/feat/splash/presentation/pages/splash_page.dart';
import 'package:hungey/rote.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Root.rootRoute,

    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: LoginPage.loginRoute,
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: HomePage.homeRoute,
        builder: (context, state) => const HomePage(),
      ), 

      GoRoute(
        path: RegesterPapge.regesterRoute,
        builder: (context, state) => const RegesterPapge(),
      ) , 

      GoRoute(
        path: Root.rootRoute,
        builder: (context, state) =>  Root(),
      ) , 
    ],
  );
}