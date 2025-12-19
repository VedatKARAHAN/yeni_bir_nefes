import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yenibirnefes/screens/splash_page.dart';
import 'package:yenibirnefes/firebase_options.dart';

Future<void> main() async {
  //Asekron fonksiyonları araştırın
  WidgetsFlutterBinding.ensureInitialized(); //Uygulama Başlamadan önce UI Hazırmı ?

  // Firebase uygulamasinin baslatilip başlamadigini kontrol ediyor
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // FireBase ile iletişimi kurar
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
