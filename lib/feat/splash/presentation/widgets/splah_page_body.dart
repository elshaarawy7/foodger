// feat/splash/presentation/pages/splash_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hungey/core/constant/app_color.dart';
import 'package:hungey/core/constant/app_images.dart';
import 'package:hungey/feat/auth/presentation/pages/login_page.dart';
import 'package:hungey/feat/home/home_page.dart';


class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody>
    with TickerProviderStateMixin {
  // ── Animation Controllers ──────────────────────────────────────────────────

  // كنترولر الـ logo — بيتحكم في الـ fade + slide من فوق
  late final AnimationController _logoController;

  // كنترولر الـ food — بيتحكم في الـ slide من تحت + fade
  late final AnimationController _foodController;

  // ── Animations ─────────────────────────────────────────────────────────────

  late final Animation<double> _logoFade;       // opacity للوجو
  late final Animation<Offset> _logoSlide;      // بينزل من فوق
  late final Animation<double> _foodFade;       // opacity للبرغر
  late final Animation<Offset> _foodSlide;      // بيطلع من تحت

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    // ── Logo Controller: 900ms ─────────────────────────────────────────────
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    // الـ logo بيظهر fade من 0 لـ 1
    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeIn, // ظهور ناعم
      ),
    );

    // الـ logo بيجي من فوق (y: -0.3 → 0)
    _logoSlide = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeOutCubic, // حركة ناعمة مع تباطؤ في الآخر
      ),
    );

    // ── Food Controller: 1000ms ────────────────────────────────────────────
    _foodController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // الـ food بيظهر fade من 0 لـ 1
    _foodFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _foodController,
        curve: Curves.easeIn,
      ),
    );

    // الـ food بيطلع من تحت (y: 0.4 → 0)
    _foodSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _foodController,
        curve: Curves.easeOutBack, // بيعمل bounce خفيف رايق في الآخر
      ),
    );
  }

  Future<void> _startAnimations() async {
    // المرحلة 1: الخلفية تظهر (فورًا)، بعدين الـ logo بعد 200ms
    await Future.delayed(const Duration(milliseconds: 200));
    _logoController.forward();

    // المرحلة 2: الـ food يطلع بعد الـ logo بـ 400ms
    await Future.delayed(const Duration(milliseconds: 400));
    _foodController.forward();

    // المرحلة 3: بعد انتهاء كل الأنيميشن، انتقل للـ home
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      // عدّل الـ route حسب الـ navigator بتاعك
      context.go("/login") ;
    }
  }

  @override
  void dispose() {
    // مهم جداً — لو نسيت dispose هيحصل memory leak
    _logoController.dispose();
    _foodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary, // الخلفية الخضرا من الـ AppColors
      body: Stack(
        children: [
          // ── Logo في المنتصف (أعلى قليلاً) ─────────────────────────────
          Align(
            alignment: const Alignment(0, -0.25), // شوية فوق المنتصف
            child: FadeTransition(
              opacity: _logoFade,
              child: SlideTransition(
                position: _logoSlide,
                child: SvgPicture.asset(
                  AppImages.logo,
                  width: 180,
                  // لو الـ logo SVG لونه داكن، خليه أبيض
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),

          // ── Food (البرغر) في الأسفل ──────────────────────────────────
          Align(
            alignment: const Alignment(0, 1.0), // أسفل الشاشة
            child: FadeTransition(
              opacity: _foodFade,
              child: SlideTransition(
                position: _foodSlide,
                child: Image.asset(
                  AppImages.foodSplash,
                  width: double.infinity,  // يملى عرض الشاشة
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}