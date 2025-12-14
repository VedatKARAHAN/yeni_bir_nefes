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
      home:
          SplashPage(), //Yetki kontrolu yapınca giriş cıkısta problem oluyor!! çöz
    );
  }
}
