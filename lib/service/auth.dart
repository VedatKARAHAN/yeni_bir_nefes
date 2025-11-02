import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChages =>_firebaseAuth.authStateChanges();//Userin durumu hakında bilgi almak ıcın mesela cıkıs yaptı dıyelım onun haberını alabılıyoruz!

  //Register
  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //Login
  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  
  
   //Sign out
  Future<void> signOut()async{
    await _firebaseAuth.signOut();
  }
}
