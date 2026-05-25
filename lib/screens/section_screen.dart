import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_theme.dart';
import '../constants/app_data.dart';

class SectionScreen extends StatelessWidget {
  final int yearIndex;
  final int faslIndex;
  final int sectionIndex;
  final String topicTitle;

  const SectionScreen({
    super.key,
    required this.yearIndex,
    required this.faslIndex,
    required this.sectionIndex,
    required this.topicTitle,
  });

  Future<void> _openDriveLink(BuildContext context) async {
    final urlString = AppData.driveLinks[yearIndex]?[faslIndex]?[sectionIndex] ?? 'https://drive.google.com';
    final url = Uri.parse(urlString);
    try {
      final launched = await launchUrl(url, mode: LaunchMode.externalApplication);
      if (!launched && context.mounted) {
        _showErrorSnackBar(context);
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context);
      }
    }
  }

  void _showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تعذر فتح الرابط. يرجى التحقق من اتصالك بالإنترنت.',
          style: GoogleFonts.cairo(fontSize: 14, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 4),
      ),
    );
  }

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
                // Custom App Bar
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
                      Flexible(
                        child: Column(
                          children: [
                            Text(AppData.sectionNames[sectionIndex],
                              style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                            Text('${AppData.fusulNames[faslIndex]} - ${AppData.yearShortNames[yearIndex]} متوسط',
                              style: GoogleFonts.cairo(fontSize: 11, color: AppColors.beige.withValues(alpha: 0.6))),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 42),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Topic Title Card
                        FadeInDown(
                          duration: const Duration(milliseconds: 600),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
                              ),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF1565C0).withValues(alpha: 0.3),
                                  blurRadius: 15, offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Icon(Icons.auto_stories_rounded, color: Colors.white, size: 48),
                                const SizedBox(height: 16),
                                Text(topicTitle,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cairo(
                                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Info cards
                        FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: _buildInfoCard(
                            icon: Icons.info_outline_rounded,
                            title: 'معلومات الدرس',
                            content: 'المادة: اللغة العربية\n'
                                '${AppData.yearNames[yearIndex]}\n'
                                '${AppData.fusulNames[faslIndex]} - ${AppData.sectionNames[sectionIndex]}',
                          ),
                        ),

                        const SizedBox(height: 16),

                        FadeInUp(
                          delay: const Duration(milliseconds: 500),
                          child: _buildInfoCard(
                            icon: Icons.lightbulb_outline_rounded,
                            title: 'الأهداف التعليمية',
                            content: '• فهم واستيعاب النص المدروس\n'
                                '• اكتساب قواعد لغوية جديدة\n'
                                '• تطوير مهارات التعبير الكتابي',
                          ),
                        ),

                        const SizedBox(height: 16),

                        FadeInUp(
                          delay: const Duration(milliseconds: 700),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => _openDriveLink(context),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(22),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF1B5E20).withValues(alpha: 0.3),
                                      blurRadius: 15, offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 48, height: 48,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: const Icon(Icons.folder_shared_rounded, color: Colors.white, size: 28),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('مجلد المقطع على Google Drive',
                                            style: GoogleFonts.cairo(
                                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                                          const SizedBox(height: 4),
                                          Text('اضغط هنا للذهاب إلى المجلد وتحميل الدروس والملخصات',
                                            style: GoogleFonts.cairo(
                                              fontSize: 12, color: Colors.white.withValues(alpha: 0.85))),
                                        ],
                                      ),
                                    ),
                                    const Icon(Icons.open_in_new_rounded, color: Colors.white, size: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildInfoCard({required IconData icon, required String title, required String content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.goldLight, size: 22),
              const SizedBox(width: 10),
              Text(title, style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 12),
          Text(content, style: GoogleFonts.cairo(fontSize: 14, color: Colors.white.withValues(alpha: 0.7), height: 1.8)),
        ],
      ),
    );
  }
}
