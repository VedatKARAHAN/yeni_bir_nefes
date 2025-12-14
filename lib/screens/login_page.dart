// lib/screens/login_page.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yenibirnefes/models/theme/app_colors.dart';
import 'package:yenibirnefes/service/auth.dart';
import 'package:yenibirnefes/screens/register_page.dart';
import 'package:yenibirnefes/screens/home_page.dart';
import 'package:yenibirnefes/screens/admin_panel_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Auth _auth = Auth();

  final String adminEmail =
      'admin@gmail.com'; //Zaman Kalmadığı için böyle yapıldı

  String? errorMessage;

  // Firebase ile giriş işlemini gerceklestirir
  Future<void> signInUser() async {
    setState(() {
      errorMessage = null; // herdenemede hata mesajini degistirmek icin.
    });
    try {
      await _auth.signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Başarılı girişten AuthGate otomatik yonlendirme yapacak(iptal)
      if (mounted) {
        final user = _auth.currentUser;
        Widget nextPage;

        if (user != null && user.email == adminEmail) {
          nextPage = const AdminPanelPage();
        } else {
          nextPage = const HomePage();
        }
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => nextPage));
      }
    } on FirebaseAuthException catch (e) {
      // Firebase'den gelen hatayı yakalayacak
      setState(() {
        errorMessage = _getAuthErrorMessage(e.code);
      });
    } catch (e) {
      // Genel hataları yakalar
      setState(() {
        errorMessage = 'Giriş sırasında bilinmeyen bir hata oluştu.';
      });
    }
  }

  // Firebase hata kodların duzgun yapmasi icin
  String _getAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'Bu e-posta adresiyle kullanıcı bulunamadı.';
      case 'wrong-password':
        return 'Hatalı şifre girdiniz.';
      case 'invalid-email':
        return 'Lütfen geçerli bir e-posta adresi giriniz.';
      default:
        return 'Giriş yapılamadı. Lütfen bilgilerinizi kontrol edin.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(4, 15),
            end: Alignment.bottomLeft,
            colors: [AppColors.primary, AppColors.background],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            // Klavye acildiginda tasma oluyordu o hata icin  kullanildi
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/clean_logo.png', height: 170),
                const SizedBox(height: 5),
                const Text(
                  'YENİ BİR NEFES',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
                const Text(
                  'Giriş Yap',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 40),

                BuildEmailTextField(emailController),
                const SizedBox(height: 10),

                BuildPasswordTextField(passwordController),
                const SizedBox(height: 20),

                // Hata Mesajı
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(
                      color: Color(0xFFE53935),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [buildLoginButton(context, signInUser)],
                ),
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Bir Hesabım Yok!',
                      style: TextStyle(color: AppColors.textDark),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Kaydol',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------------

  TextField BuildPasswordTextField(TextEditingController controller) {
    return TextField(
      obscureText: true,
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 18, color: AppColors.textDark),
      controller: controller,
      cursorColor: AppColors.textDark,
      maxLength: 60,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textLight,
        hintText: 'Şifrenizi giriniz',
        hintStyle: TextStyle(color: AppColors.textDark.withOpacity(0.4)),
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 20.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.primary, width: 2.5),
        ),
      ),
    );
  }

  TextField BuildEmailTextField(TextEditingController controller) {
    return TextField(
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 18, color: AppColors.textDark),
      controller: controller,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.textDark,
      maxLength: 60,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textLight,
        hintText: 'E-posta adresinizi giriniz',
        hintStyle: TextStyle(color: AppColors.textDark.withOpacity(0.4)),
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 20.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.primary, width: 2.5),
        ),
      ),
    );
  }
}

ElevatedButton buildLoginButton(BuildContext context, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: const Text(
      'Giriş Yap',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textLight,
      fixedSize: const Size(150.0, 50.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
  );
}
