import 'package:flutter/material.dart';
import 'package:yenibirnefes/models/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Bunlar TextField atlındakı controllerlara atanıyor !
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String?
  errorMessage; //TextFieldlerin altında 3. child olacak hatayı yazdırmaya yarayacak!
  //Kullanımı errorMessage != null ? Text(ErrorMessage!) : SizedBox.shrink() :
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                      'Giriş Yap',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 40),
                    BuildEmailTextField(),
                    SizedBox(height: 10),
                    BuildPasswordTextField(),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [buildLoginButton(context)],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bir Hesabım Yok!'),
                    SizedBox(width: 2),
                    Text(
                      'Kaydol',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
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

  TextField BuildPasswordTextField() {
    //Boyut İçin Container içine alacagım ama anlamadıgım bir hata verıyor projenın test aşamasından once bırdaha bak
    return TextField(
      obscureText: true,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 18, color: AppColors.textDark),
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword, //klavyeyide degistirıyor!
      cursorColor: AppColors.textDark,
      maxLength: 60,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.textDark, width: 1.0),
        ),

        hintText: 'Şifrenizi giriniz',
        hintStyle: TextStyle(color: AppColors.textDark.withOpacity(0.3)),
        counterText: '',
      ),
    );
  }

  TextField BuildEmailTextField() {
    //Boyut İçin Container içine alacagım ama anlamadıgım bir hata verıyor projenın test aşamasından once bırdaha bak
    return TextField(
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 18, color: AppColors.textDark),
      controller: emailController,
      autofocus: true,
      keyboardType: TextInputType.emailAddress, //klavyeyide degistirıyor!
      cursorColor: AppColors.textDark,
      maxLength: 60,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.textDark, width: 1.0),
        ),

        hintText: 'E-posta adresinizi giriniz',
        hintStyle: TextStyle(color: AppColors.textDark.withOpacity(0.3)),
        counterText: '',
      ),
    );
  }
}

ElevatedButton buildLoginButton(context) {
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    },
  );
}
