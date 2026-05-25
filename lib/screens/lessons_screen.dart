import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_theme.dart';
import '../constants/app_data.dart';
import 'year_detail_screen.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.navyBlue, AppColors.navyBlueDark],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 42, height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                        ),
                      ),
                      const Spacer(),
                      Text('الدروس',
                        style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                      const Spacer(),
                      const SizedBox(width: 42),
                    ],
                  ),
                ),
                FadeIn(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text('اختر السنة الدراسية',
                      style: GoogleFonts.cairo(fontSize: 14, color: AppColors.beige.withValues(alpha: 0.6))),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.85,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return FadeInUp(
                          delay: Duration(milliseconds: 200 + (index * 150)),
                          duration: const Duration(milliseconds: 600),
                          child: _buildYearCard(context, index),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildYearCard(BuildContext context, int index) {
    final gradients = [
      [const Color(0xFF1B5E20), const Color(0xFF388E3C)],
      [const Color(0xFF0D47A1), const Color(0xFF1976D2)],
      [const Color(0xFFE65100), const Color(0xFFEF6C00)],
      [const Color(0xFFB71C1C), const Color(0xFFD32F2F)],
    ];
    final icons = [Icons.looks_one_rounded, Icons.looks_two_rounded, Icons.looks_3_rounded, Icons.looks_4_rounded];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (c, a, s) => YearDetailScreen(yearIndex: index),
            transitionsBuilder: (c, a, s, child) => FadeTransition(opacity: a, child: child),
          ));
        },
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: gradients[index]),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: gradients[index][0].withValues(alpha: 0.4), blurRadius: 12, offset: const Offset(0, 6))],
          ),
          child: Stack(
            children: [
              Positioned(left: -20, bottom: -20,
                child: Icon(icons[index], size: 100, color: Colors.white.withValues(alpha: 0.08))),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 56, height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: Text(AppData.yearEmojis[index], style: const TextStyle(fontSize: 28))),
                    ),
                    const SizedBox(height: 14),
                    Text('السنة', style: GoogleFonts.cairo(fontSize: 14, color: Colors.white.withValues(alpha: 0.8))),
                    Text(AppData.yearShortNames[index],
                      style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 4),
                    Text('متوسط', style: GoogleFonts.cairo(fontSize: 13, color: Colors.white.withValues(alpha: 0.7))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
