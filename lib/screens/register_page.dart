import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yenibirnefes/models/theme/app_colors.dart';
import 'package:yenibirnefes/service/auth.dart';
import 'package:yenibirnefes/screens/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final Auth _auth = Auth();

  String? errorMessage;

  // Firebase ile kayıt işlemini gerçeklestirir
  Future<void> registerUser() async {
    setState(() {
      errorMessage = null;
    });

    if (passwordController.text.trim() !=
        passwordConfirmController.text.trim()) {
      setState(() {
        errorMessage = 'Şifreler uyuşmuyor! Lütfen kontrol edin.';
      });
      return;
    }

    try {
      await _auth.createUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Başarılı kayıt sonrası kullanıcıyı bilgilendir
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Kayıt başarılı! Giriş yapabilirsiniz.'),
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Firebase hata yönetimi
      setState(() {
        errorMessage = _getAuthErrorMessage(e.code);
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Kayıt sırasında bilinmeyen bir hata oluştu.';
      });
    }
  }

  String _getAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return 'Şifre çok zayıf. En az 6 karakter olmalı.';
      case 'email-already-in-use':
        return 'Bu e-posta adresi zaten kullanımda.';
      case 'invalid-email':
        return 'Lütfen geçerli bir e-posta adresi giriniz.';
      default:
        return 'Kayıt yapılamadı.';
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
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/clean_logo.png', height: 120),
                const SizedBox(height: 10),
                const Text(
                  'YENİ BİR NEFES',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
                const Text(
                  'Hesap Oluştur',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 10),
                // E-posta
                BuildEmailTextField(emailController),
                const SizedBox(height: 10),
                // Şifre
                BuildPasswordTextField(passwordController),
                const SizedBox(height: 10),
                // Şifre Tekrarı
                BuildPasswordConfirmTextField(passwordConfirmController),

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

                // Kayıt Ol Butonu
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [buildRegisterButton(context, registerUser)],
                ),

                const SizedBox(height: 30),

                // Giriş Yap Bağlantısı
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Zaten Bir Hesabım Var mı?',
                      style: TextStyle(color: AppColors.textDark),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        // Giriş sayfasına yönlendir
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Giriş Yap',
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

  //--------------------------------------------------------------------------

  TextField BuildEmailTextField(TextEditingController controller) {
    return TextField(
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 18, color: AppColors.textDark),
      controller: controller,
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

  TextField BuildPasswordTextField(TextEditingController controller) {
    return TextField(
      obscureText: true,
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 18, color: AppColors.textDark),
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
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

  TextField BuildPasswordConfirmTextField(TextEditingController controller) {
    return TextField(
      obscureText: true,
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 18, color: AppColors.textDark),
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: AppColors.textDark,
      maxLength: 60,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textLight,
        hintText: 'Şifrenizi tekrar giriniz',
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

ElevatedButton buildRegisterButton(
  BuildContext context,
  VoidCallback onPressed,
) {
  return ElevatedButton(
    onPressed: onPressed, // Kayit metodunu calistirir
    child: const Text(
      'Kayıt Ol',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary, //
      foregroundColor: AppColors.textLight,
      fixedSize: const Size(150.0, 50.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
  );
}
