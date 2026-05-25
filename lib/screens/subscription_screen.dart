import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_theme.dart';
import '../constants/app_data.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  Future<void> _openWhatsApp(BuildContext context) async {
    final url = Uri.parse('https://wa.me/${AppData.whatsappNumber}?text=السلام عليكم، أريد الاشتراك في منارة اللغة العربية');
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
          'تعذر فتح تطبيق واتساب. يمكنك التواصل معنا مباشرة على الرقم: +213 659 30 02 50',
          style: GoogleFonts.cairo(fontSize: 14, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 5),
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
                // App Bar
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
                      Text('الاشتراك',
                        style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                      const Spacer(),
                      const SizedBox(width: 42),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        // Price Card
                        FadeInDown(
                          duration: const Duration(milliseconds: 600),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(28),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft, end: Alignment.bottomRight,
                                colors: [Color(0xFFD4A853), Color(0xFFC49742), Color(0xFFB8860B)],
                              ),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.gold.withValues(alpha: 0.4),
                                  blurRadius: 20, offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 48),
                                const SizedBox(height: 12),
                                Text('قيمة الاشتراك',
                                  style: GoogleFonts.cairo(fontSize: 16, color: Colors.white.withValues(alpha: 0.9))),
                                const SizedBox(height: 8),
                                Text('500 دج فقط',
                                  style: GoogleFonts.cairo(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text('وصول كامل لجميع المحتويات',
                                    style: GoogleFonts.cairo(fontSize: 13, color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Features list
                        FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ماذا ستجد داخل المجموعة؟',
                                  style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gold)),
                                const SizedBox(height: 16),
                                _buildFeatureItem('نصوص جاهزة ومكتملة', Icons.check_circle_rounded),
                                _buildFeatureItem('أفكار عامة شاملة', Icons.check_circle_rounded),
                                _buildFeatureItem('حلول نموذجية دقيقة', Icons.check_circle_rounded),
                                _buildFeatureItem('أسئلة وفق المنهج', Icons.check_circle_rounded),
                                _buildFeatureItem('ملفات منظمة وجاهزة للطباعة', Icons.check_circle_rounded),
                                _buildFeatureItem('توفير الوقت والجهد', Icons.check_circle_rounded),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // WhatsApp Contact Button
                        FadeInUp(
                          delay: const Duration(milliseconds: 500),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => _openWhatsApp(context),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFF25D366), Color(0xFF128C7E)],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.whatsappGreen.withValues(alpha: 0.4),
                                      blurRadius: 15, offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.message_rounded, color: Colors.white, size: 28),
                                    const SizedBox(width: 12),
                                    Text('تواصل معنا عبر واتساب',
                                      style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Subscription info image
                        FadeInUp(
                          delay: const Duration(milliseconds: 700),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  blurRadius: 15, offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('assets/images/subscription_info.jpeg', fit: BoxFit.cover),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
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

  Widget _buildFeatureItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF4CAF50), size: 20),
          const SizedBox(width: 12),
          Text(text, style: GoogleFonts.cairo(fontSize: 14, color: Colors.white.withValues(alpha: 0.85))),
        ],
      ),
    );
  }
}
