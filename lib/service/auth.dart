// lib/service/auth.dart
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  // Firebase Authentication örneğini oluşturur.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Oturum açmış olan mevcut kullanıcıyı döndürür.
  User? get currentUser => _firebaseAuth.currentUser;

  // Kullanıcının oturum durumundaki değişiklikleri (giriş/çıkış) yayınlayan akış (Stream).
  // Bu, uygulamanın sürekli kullanıcı durumunu dinlemesini sağlar (AuthGate için hayati).
  Stream<User?> get authStateChanges => _firebaseAuth
      .authStateChanges(); // Düzeltme: authStateChages -> authStateChanges

  // Yeni kullanıcı kaydı (Register) işlemi.
  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Kullanıcı giriş (Login) işlemi.
  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Kullanıcı çıkış (Sign out) işlemi.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
