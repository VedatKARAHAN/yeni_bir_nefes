import 'package:flutter/material.dart';
import 'package:yenibirnefes/service/auth.dart';
import 'package:yenibirnefes/screens/login_page.dart';
import 'package:yenibirnefes/models/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ana Sayfa',
          style: TextStyle(
            color: AppColors.textLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.textLight),
            onPressed: () async {
              await auth.signOut();
              // Burada bir hata var kesinlikle çöz hata:Mesela giriş başarılı yaptım çıkış yaparsam home veya admin panelinden birdaha giris yapamıyorum
              if (context.mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_border,
              size: 100,
              color: AppColors.primary,
            ),
            const SizedBox(height: 20),
            Text(
              'Hoş geldiniz, ${auth.currentUser?.email ?? 'Kullanıcı'}!',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Yeni bir nefes için tebrikler!',
              style: TextStyle(fontSize: 16, color: AppColors.textDark),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
