import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_theme.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    _progressController.forward();

    _markOpened();
    _navigateToHome();
  }

  Future<void> _markOpened() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('open_count') ?? 0;
    await prefs.setInt('open_count', count + 1);
    await prefs.setString(
        'last_opened', DateTime.now().toIso8601String());
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3500));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                )),
                child: child,
              ),
            );
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.navyBlue,
              AppColors.navyBlueDark,
              Color(0xFF0A1020),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Animated Logo
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1.0 + (_pulseController.value * 0.03),
                      child: child,
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gold.withValues(alpha: 0.3),
                          blurRadius: 30,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // App Name with animation
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 800),
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [AppColors.gold, AppColors.goldLight, AppColors.gold],
                  ).createShader(bounds),
                  child: Text(
                    'منارة اللغة العربية',
                    style: GoogleFonts.cairo(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Slogan
              FadeInUp(
                delay: const Duration(milliseconds: 700),
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'نحو مستقبل مبدع',
                  style: GoogleFonts.cairo(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: AppColors.beige.withValues(alpha: 0.8),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Teacher name
              FadeInUp(
                delay: const Duration(milliseconds: 900),
                duration: const Duration(milliseconds: 800),
                child: Text(
                  'الأستاذ بن مزوز حمزة',
                  style: GoogleFonts.cairo(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.goldLight.withValues(alpha: 0.7),
                  ),
                ),
              ),

              const Spacer(flex: 2),

              // Loading indicator
              FadeInUp(
                delay: const Duration(milliseconds: 1100),
                duration: const Duration(milliseconds: 600),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: _progressAnimation.value,
                              minHeight: 4,
                              backgroundColor:
                                  AppColors.beige.withValues(alpha: 0.15),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.gold),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'جاري التحميل...',
                            style: GoogleFonts.cairo(
                              fontSize: 13,
                              color: AppColors.beige.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
