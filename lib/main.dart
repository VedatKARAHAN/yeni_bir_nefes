import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yenibirnefes/service/auth.dart';
import 'package:yenibirnefes/screens/login_page.dart';
import 'package:yenibirnefes/screens/splash_page.dart';
import 'package:yenibirnefes/screens/home_page.dart';
import 'package:yenibirnefes/screens/admin_panel_page.dart';
import 'package:yenibirnefes/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase uygulamasinin baslatilip basmlamadigini kontrol ediyor
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'YENİ BİR NEFES',
      debugShowCheckedModeBanner: false,
      home: AuthGate(), //Yetki kontrolu
    );
  }
}

//Gonderilecek sayfa belırmeleme
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  // Zaman kalmadigi icin boyle yapiliyor
  final String adminEmail = 'admin@gmail.com';

  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();

    // Firebase oturum durumunu dinler
    return StreamBuilder<User?>(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        // Oturum durumu kontrol ediliyor
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashPage();
        }

        if (snapshot.hasData) {
          final user = snapshot.data;

          if (user != null && user.email == adminEmail) {
            return const AdminPanelPage();
          }

          // normal kullanıcıysa anasayfaya gonderir burda kontrol etmiyor gibi gorüyor ama sifre ve mailin dogru olup olmadini firebase kontrol ediyor zaten
          return const HomePage();
        }

        // Kullanıcı oturum açmamışsa
        return const LoginPage();
      },
    );
  }
}
