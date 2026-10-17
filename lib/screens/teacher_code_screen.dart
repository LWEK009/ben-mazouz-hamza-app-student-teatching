import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_data.dart';
import '../constants/app_theme.dart';
import '../services/access_service.dart';

/// Hidden teacher tool: long-press the home logo, enter PIN, generate a device code.
class TeacherCodeScreen extends StatefulWidget {
  const TeacherCodeScreen({super.key});

  @override
  State<TeacherCodeScreen> createState() => _TeacherCodeScreenState();
}

class _TeacherCodeScreenState extends State<TeacherCodeScreen> {
  final _pinController = TextEditingController();
  final _deviceController = TextEditingController();
  bool _unlocked = false;
  String? _generatedCode;

  @override
  void dispose() {
    _pinController.dispose();
    _deviceController.dispose();
    super.dispose();
  }

  void _checkPin() {
    if (_pinController.text.trim() == AppData.teacherPin) {
      setState(() => _unlocked = true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'الرمز السري غير صحيح',
            style: GoogleFonts.cairo(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _generate() {
    final id = AccessService.normalizeDeviceId(_deviceController.text);
    if (id.length != 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'رقم الجهاز يجب أن يكون 8 أحرف مثل ABCD-EFGH',
            style: GoogleFonts.cairo(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }
    setState(() {
      _generatedCode = AccessService.instance.codeForDevice(id);
    });
  }

  Future<void> _copyCode() async {
    final code = _generatedCode;
    if (code == null) return;
    await Clipboard.setData(ClipboardData(text: code));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تم نسخ الرمز: $code',
          style: GoogleFonts.cairo(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.emeraldGreen,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
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
                        'إنشاء رمز التفعيل',
                        style: GoogleFonts.cairo(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 42),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Expanded(
                    child: _unlocked ? _generator() : _pinGate(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pinGate() {
    return Column(
      children: [
        Text(
          'أدخل الرمز السري للأستاذ',
          style: GoogleFonts.cairo(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _pinController,
          obscureText: true,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(fontSize: 22, color: Colors.white, letterSpacing: 8),
          decoration: InputDecoration(
            hintText: '••••',
            hintStyle: GoogleFonts.cairo(color: Colors.white30),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.08),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _checkPin,
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, foregroundColor: AppColors.navyBlueDark),
            child: Text('دخول', style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
        ),
      ],
    );
  }

  Widget _generator() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'بعد الدفع، أرسل الطالب رقم جهازه على واتساب. أدخله هنا لإنشاء رمزه.',
            style: GoogleFonts.cairo(fontSize: 14, color: Colors.white70, height: 1.6),
          ),
          const SizedBox(height: 18),
          Text(
            'رقم جهاز الطالب',
            style: GoogleFonts.cairo(fontSize: 14, color: AppColors.gold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _deviceController,
            textCapitalization: TextCapitalization.characters,
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(fontSize: 22, color: Colors.white, letterSpacing: 3),
            decoration: InputDecoration(
              hintText: 'ABCD-EFGH',
              hintStyle: GoogleFonts.cairo(color: Colors.white30, letterSpacing: 3),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.08),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _generate,
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.gold, foregroundColor: AppColors.navyBlueDark),
              child: Text('إنشاء الرمز', style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
          if (_generatedCode != null) ...[
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.gold.withValues(alpha: 0.5)),
              ),
              child: Column(
                children: [
                  Text('رمز التفعيل', style: GoogleFonts.cairo(color: Colors.white70)),
                  const SizedBox(height: 8),
                  Text(
                    _generatedCode!,
                    style: GoogleFonts.cairo(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gold,
                      letterSpacing: 6,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _copyCode,
                    icon: const Icon(Icons.copy_rounded, color: AppColors.goldLight),
                    label: Text('نسخ الرمز وإرساله للطالب', style: GoogleFonts.cairo(color: AppColors.goldLight)),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
