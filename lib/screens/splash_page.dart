// lib/screens/splash_page.dart
import 'package:flutter/material.dart';
import 'package:yenibirnefes/models/theme/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Arka Plan
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(4, 15),
            end: Alignment.bottomLeft,
            colors: [AppColors.primary, AppColors.background],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/clean_logo.png', height: 200),
              const SizedBox(height: 20),
              const Text(
                'YENİ BİR NEFES',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 50),
              // Yükleniyor Göstergesi
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                strokeWidth: 5,
              ),
              const SizedBox(height: 20),
              const Text(
                'Oturum Kontrol Ediliyor...',
                style: TextStyle(fontSize: 16, color: AppColors.textDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
