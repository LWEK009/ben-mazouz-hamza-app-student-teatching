import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_theme.dart';
import '../constants/app_data.dart';
import 'lessons_screen.dart';
import 'teacher_work_screen.dart';
import 'subscription_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  void _navigateTo(Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            )),
            child: child,
          );
        },
      ),
    );
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
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Logo & Title Section
                  FadeInDown(
                    duration: const Duration(milliseconds: 600),
                    child: AnimatedBuilder(
                      animation: _floatController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset:
                              Offset(0, -3 + (_floatController.value * 6)),
                          child: child,
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.gold.withValues(alpha: 0.5),
                              width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.gold.withValues(alpha: 0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
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

                  const SizedBox(height: 16),

                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    duration: const Duration(milliseconds: 600),
                    child: Text(
                      AppData.appName,
                      style: GoogleFonts.cairo(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.gold,
                      ),
                    ),
                  ),

                  FadeInDown(
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 600),
                    child: Text(
                      AppData.appSlogan,
                      style: GoogleFonts.cairo(
                        fontSize: 15,
                        color: AppColors.beige.withValues(alpha: 0.7),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Decorative divider
                  FadeIn(
                    delay: const Duration(milliseconds: 400),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 1.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.gold.withValues(alpha: 0.7),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.auto_awesome,
                            color: AppColors.gold.withValues(alpha: 0.6),
                            size: 16),
                        const SizedBox(width: 8),
                        Container(
                          width: 40,
                          height: 1.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.gold.withValues(alpha: 0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Main Buttons
                  FadeInUp(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 700),
                    child: _buildMainButton(
                      title: 'الدروس',
                      subtitle: 'جميع دروس المرحلة المتوسطة',
                      icon: Icons.menu_book_rounded,
                      gradientColors: [
                        const Color(0xFF1B5E20),
                        const Color(0xFF2E7D32),
                        const Color(0xFF43A047),
                      ],
                      onTap: () => _navigateTo(const LessonsScreen()),
                    ),
                  ),

                  const SizedBox(height: 20),

                  FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 700),
                    child: _buildMainButton(
                      title: 'أعمال الأستاذ',
                      subtitle: 'الملخصات والوثائق التعليمية',
                      icon: Icons.workspace_premium_rounded,
                      gradientColors: [
                        const Color(0xFF4A148C),
                        const Color(0xFF6A1B9A),
                        const Color(0xFF8E24AA),
                      ],
                      onTap: () => _navigateTo(const TeacherWorkScreen()),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Subscription Button
                  FadeInUp(
                    delay: const Duration(milliseconds: 900),
                    duration: const Duration(milliseconds: 700),
                    child: GestureDetector(
                      onTap: () => _navigateTo(const SubscriptionScreen()),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.gold.withValues(alpha: 0.2),
                              AppColors.goldLight.withValues(alpha: 0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.gold.withValues(alpha: 0.4),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: AppColors.gold,
                              size: 26,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'الاشتراك',
                              style: GoogleFonts.cairo(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.gold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.gold.withValues(alpha: 0.6),
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Footer
                  FadeIn(
                    delay: const Duration(milliseconds: 1100),
                    child: Text(
                      '${AppData.teacherName} ©',
                      style: GoogleFonts.cairo(
                        fontSize: 12,
                        color: AppColors.beige.withValues(alpha: 0.3),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: gradientColors[1].withValues(alpha: 0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.cairo(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.cairo(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white.withValues(alpha: 0.5),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
