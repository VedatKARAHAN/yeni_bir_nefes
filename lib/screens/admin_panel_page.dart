import 'package:flutter/material.dart';
import 'package:yenibirnefes/service/auth.dart';
import 'package:yenibirnefes/screens/login_page.dart';
import 'package:yenibirnefes/models/theme/app_colors.dart';

class AdminPanelPage extends StatelessWidget {
  const AdminPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();
    const Color adminColor = Colors.red;
    const Color adminAccent = Colors.redAccent;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Yönetim Paneli',
          style: TextStyle(
            color: AppColors.textLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: adminColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.textLight),
            onPressed: () async {
              await auth.signOut(); //Bir hata var çözemedim !!! Kesinlikle bak!
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
              Icons.admin_panel_settings,
              size: 100,
              color: adminColor,
            ),
            const SizedBox(height: 20),
            Text(
              'Yönetici Olarak Giriş Yaptınız:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Admin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: adminColor,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Kullanıcıları Yönet Butonu
            ElevatedButton.icon(
              onPressed: () {
                //FireStoreEntegrasyonu sonrasında Kullanici yonetim sayfasi olusturualacak oraya atama yapacak!
              },
              icon: const Icon(Icons.people_alt, color: AppColors.textLight),
              label: const Text(
                'Kullanıcıları Yönet',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: adminAccent,
                foregroundColor: AppColors.textLight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
