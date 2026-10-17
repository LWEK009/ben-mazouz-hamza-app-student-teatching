import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_data.dart';
import '../constants/app_theme.dart';
import '../services/access_service.dart';

class UnlockScreen extends StatefulWidget {
  const UnlockScreen({super.key});

  @override
  State<UnlockScreen> createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen> {
  final _codeController = TextEditingController();
  String _deviceId = '';
  bool _loading = true;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _loadDevice();
  }

  Future<void> _loadDevice() async {
    final id = await AccessService.instance.getDeviceId();
    if (!mounted) return;
    setState(() {
      _deviceId = id;
      _loading = false;
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _copyDeviceId() async {
    await Clipboard.setData(ClipboardData(text: _deviceId));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تم نسخ رقم الجهاز: $_deviceId',
          style: GoogleFonts.cairo(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.emeraldGreen,
      ),
    );
  }

  Future<void> _openWhatsApp() async {
    final text = Uri.encodeComponent(
      'السلام عليكم، أريد الاشتراك في منارة اللغة العربية (500 دج).\n'
      'رقم الجهاز: $_deviceId\n'
      'أرسلت مبلغ الاشتراك.',
    );
    final url = Uri.parse('https://wa.me/${AppData.whatsappNumber}?text=$text');
    try {
      final launched = await launchUrl(url, mode: LaunchMode.externalApplication);
      if (!launched && mounted) {
        _showMessage('تعذر فتح واتساب. الرقم: +213 659 30 02 50', isError: true);
      }
    } catch (_) {
      if (mounted) {
        _showMessage('تعذر فتح واتساب. الرقم: +213 659 30 02 50', isError: true);
      }
    }
  }

  Future<void> _submitCode() async {
    setState(() => _submitting = true);
    final ok = await AccessService.instance.tryUnlock(_codeController.text);
    if (!mounted) return;
    setState(() => _submitting = false);
    if (ok) {
      _showMessage('تم تفعيل الاشتراك على هذا الجهاز');
      Navigator.pop(context, true);
    } else {
      _showMessage('الرمز غير صحيح أو لا يخص هذا الجهاز', isError: true);
    }
  }

  void _showMessage(String text, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: GoogleFonts.cairo(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        backgroundColor: isError ? Colors.redAccent : AppColors.emeraldGreen,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context, false),
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'تفعيل الاشتراك',
                        style: GoogleFonts.cairo(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 42),
                    ],
                  ),
                ),
                Expanded(
                  child: _loading
                      ? const Center(child: CircularProgressIndicator(color: AppColors.gold))
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              FadeInDown(
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFFD4A853), Color(0xFFB8860B)],
                                    ),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    children: [
                                      const Icon(Icons.lock_rounded, color: Colors.white, size: 42),
                                      const SizedBox(height: 10),
                                      Text(
                                        '500 دج فقط',
                                        style: GoogleFonts.cairo(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'ادفع عبر واتساب ثم أدخل رمز التفعيل',
                                        style: GoogleFonts.cairo(
                                          fontSize: 14,
                                          color: Colors.white.withValues(alpha: 0.9),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              FadeInUp(
                                child: _box(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'خطوات التفعيل',
                                        style: GoogleFonts.cairo(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.gold,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      _step('1', 'ادفع قيمة الاشتراك عبر واتساب'),
                                      _step('2', 'أرسل رقم الجهاز الظاهر أسفله'),
                                      _step('3', 'ستصلك 8 أرقام. أدخلها هنا لفتح دروس Drive'),
                                      _step('4', 'الرمز يعمل على هذا الهاتف فقط'),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              FadeInUp(
                                delay: const Duration(milliseconds: 150),
                                child: _box(
                                  child: Column(
                                    children: [
                                      Text(
                                        'رقم هذا الجهاز',
                                        style: GoogleFonts.cairo(
                                          fontSize: 14,
                                          color: Colors.white.withValues(alpha: 0.75),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        _deviceId,
                                        style: GoogleFonts.cairo(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.gold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      TextButton.icon(
                                        onPressed: _copyDeviceId,
                                        icon: const Icon(Icons.copy_rounded, color: AppColors.goldLight),
                                        label: Text(
                                          'نسخ رقم الجهاز',
                                          style: GoogleFonts.cairo(color: AppColors.goldLight),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              FadeInUp(
                                delay: const Duration(milliseconds: 250),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: _openWhatsApp,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(vertical: 18),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [Color(0xFF25D366), Color(0xFF128C7E)],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.chat_rounded, color: Colors.white, size: 26),
                                          const SizedBox(width: 10),
                                          Text(
                                            'ادفع عبر واتساب',
                                            style: GoogleFonts.cairo(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              FadeInUp(
                                delay: const Duration(milliseconds: 350),
                                child: _box(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'رمز التفعيل (8 أرقام)',
                                        style: GoogleFonts.cairo(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      TextField(
                                        controller: _codeController,
                                        keyboardType: TextInputType.number,
                                        maxLength: 8,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cairo(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: 6,
                                        ),
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        decoration: InputDecoration(
                                          counterText: '',
                                          hintText: '••••••••',
                                          hintStyle: GoogleFonts.cairo(
                                            color: Colors.white.withValues(alpha: 0.3),
                                            letterSpacing: 6,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white.withValues(alpha: 0.08),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14),
                                            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14),
                                            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(14),
                                            borderSide: const BorderSide(color: AppColors.gold, width: 1.5),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 14),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: _submitting ? null : _submitCode,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.gold,
                                            foregroundColor: AppColors.navyBlueDark,
                                            padding: const EdgeInsets.symmetric(vertical: 14),
                                          ),
                                          child: _submitting
                                              ? const SizedBox(
                                                  width: 22,
                                                  height: 22,
                                                  child: CircularProgressIndicator(strokeWidth: 2),
                                                )
                                              : Text(
                                                  'تفعيل',
                                                  style: GoogleFonts.cairo(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 28),
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

  Widget _box({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: child,
    );
  }

  Widget _step(String n, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.gold,
              shape: BoxShape.circle,
            ),
            child: Text(
              n,
              style: GoogleFonts.cairo(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlueDark,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.cairo(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.85),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
