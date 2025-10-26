import 'package:flutter/material.dart';
import 'package:yenibirnefes/models/theme/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/clean_logo.png', height: 170),
              //SizedBox(height: 5),
              Column(
                children: [
                  Text(
                    'YENİ BİR NEFES',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    'Sigarayı Bırak, Hayata Yeniden Başla',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildLoginButton(),
                  SizedBox(width: 40),
                  buildSignUpButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Butonları Widget olarak oluşturmamın sebebi  Biz bunları diger sayfalarda kullanacagız ama
  // diger sayfadakılerın actıonları farklı olacak ihtiyacın olursa kopyala ama action degistir!
  ElevatedButton buildLoginButton() {
    return ElevatedButton(
      child: const Text('Giriş Yap'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.textLight,
        foregroundColor: AppColors.primary,
        fixedSize: const Size(110.0, 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
          side: const BorderSide(color: AppColors.primary, width: 1.0),
        ),
      ),
      onPressed: () {
        //Navigator ile ka login_page ye atılacak!
        print('Giriş butonuna basıldı!');
      },
    );
  }

  // Butonları Widget olarak oluşturmamın sebebi  Biz bunları diger sayfalarda kullanacagız ama
  // diger sayfadakılerın actıonları farklı olacak ihtiyacın olursa kopyala ama action degistir!
  ElevatedButton buildSignUpButton() {
    return ElevatedButton(
      child: const Text('Kaydol'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        fixedSize: const Size(110.0, 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
          side: const BorderSide(color: AppColors.textLight, width: 1.0),
        ),
      ),
      onPressed: () {
        //Navigator ile ka signup_page ye atılacak!
        print('Kaydol butonuna basıldı!');
      },
    );
  }
}
