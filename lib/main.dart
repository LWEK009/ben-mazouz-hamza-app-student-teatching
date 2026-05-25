import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/app_theme.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.navyBlueDark,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  // Initialize SharedPreferences
  await SharedPreferences.getInstance();

  runApp(const ManaretApp());
}

class ManaretApp extends StatelessWidget {
  const ManaretApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'منارة اللغة العربية',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: const Locale('ar', 'DZ'),
      home: const SplashScreen(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
