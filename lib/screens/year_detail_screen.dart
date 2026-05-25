import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_theme.dart';
import '../constants/app_data.dart';
import 'fasl_detail_screen.dart';

class YearDetailScreen extends StatelessWidget {
  final int yearIndex;
  const YearDetailScreen({super.key, required this.yearIndex});

  @override
  Widget build(BuildContext context) {
    final List<List<Color>> faslGradients = [
      [const Color(0xFF00695C), const Color(0xFF00897B)],
      [const Color(0xFF283593), const Color(0xFF3949AB)],
      [const Color(0xFF4E342E), const Color(0xFF6D4C41)],
    ];
    final List<IconData> faslIcons = [
      Icons.filter_1_rounded,
      Icons.filter_2_rounded,
      Icons.filter_3_rounded,
    ];
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
                      Text(AppData.yearNames[yearIndex],
                        style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      const Spacer(),
                      const SizedBox(width: 42),
                    ],
                  ),
                ),
                FadeIn(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text('اختر الفصل الدراسي',
                      style: GoogleFonts.cairo(fontSize: 14, color: AppColors.beige.withValues(alpha: 0.6))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return FadeInUp(
                        delay: Duration(milliseconds: 200 + (index * 200)),
                        duration: const Duration(milliseconds: 600),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(milliseconds: 500),
                                    pageBuilder: (c, a, s) => FaslDetailScreen(yearIndex: yearIndex, faslIndex: index),
                                    transitionsBuilder: (c, a, s, child) => FadeTransition(opacity: a, child: child),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft, end: Alignment.bottomRight,
                                    colors: faslGradients[index],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: faslGradients[index][0].withValues(alpha: 0.4),
                                      blurRadius: 12, offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 52, height: 52,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Icon(faslIcons[index], color: Colors.white, size: 28),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(AppData.fusulNames[index],
                                            style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                                          Text('3 حصص دراسية',
                                            style: GoogleFonts.cairo(fontSize: 13, color: Colors.white.withValues(alpha: 0.7))),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.arrow_back_ios_new, color: Colors.white.withValues(alpha: 0.5), size: 18),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
