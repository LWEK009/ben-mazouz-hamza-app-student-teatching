import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import '../constants/app_theme.dart';
import '../constants/app_data.dart';
import 'section_screen.dart';

class FaslDetailScreen extends StatelessWidget {
  final int yearIndex;
  final int faslIndex;
  const FaslDetailScreen({super.key, required this.yearIndex, required this.faslIndex});

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
                      Column(
                        children: [
                          Text(AppData.fusulNames[faslIndex],
                            style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text(AppData.yearNames[yearIndex],
                            style: GoogleFonts.cairo(fontSize: 12, color: AppColors.beige.withValues(alpha: 0.6))),
                        ],
                      ),
                      const Spacer(),
                      const SizedBox(width: 42),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final topic = AppData.lessonTopics[yearIndex]?[faslIndex]?[index] ?? 'المقطع ${index + 1}';
                      final List<Color> sectionColors = [
                        const Color(0xFF0277BD),
                        const Color(0xFF00838F),
                        const Color(0xFF2E7D32),
                      ];
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
                                  MaterialPageRoute(
                                    builder: (c) => SectionScreen(
                                      yearIndex: yearIndex,
                                      faslIndex: faslIndex,
                                      sectionIndex: index,
                                      topicTitle: topic,
                                    ),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: sectionColors[index].withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: sectionColors[index].withValues(alpha: 0.3),
                                    width: 1.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 48, height: 48,
                                      decoration: BoxDecoration(
                                        color: sectionColors[index].withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Center(
                                        child: Text(AppData.sectionEmojis[index],
                                          style: const TextStyle(fontSize: 24)),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(AppData.sectionNames[index],
                                            style: GoogleFonts.cairo(
                                              fontSize: 12, color: sectionColors[index].withValues(alpha: 0.8))),
                                          const SizedBox(height: 4),
                                          Text(topic,
                                            style: GoogleFonts.cairo(
                                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                            maxLines: 2, overflow: TextOverflow.ellipsis),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.arrow_back_ios_new,
                                      color: Colors.white.withValues(alpha: 0.3), size: 16),
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
