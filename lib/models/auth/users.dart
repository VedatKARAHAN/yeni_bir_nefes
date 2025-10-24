abstract class Users {
  final String uid;
  final String email;
  final String rol;

  Users({required this.uid, required this.email, required this.rol});

  String getPage();
}

class NormalUser extends Users {
  final int dailyCigarettes;
  final double packPrice;
  DateTime? quitDate;

  NormalUser({
    required String uid,
    required String email,
    required this.dailyCigarettes,
    required this.packPrice,
    this.quitDate,
  }) : super(uid: uid, email: email, rol: 'user');

  @override
  String getPage() {
    return ' '; //Kullanıcının sayfasını getırecek
  }
}

class Admin extends Users {
  // Constructor:
  Admin({required String uid, required String email})
    : super(uid: uid, email: email, rol: 'admin');

  @override
  String getPage() {
    return ' '; //admin panelini getirecek
  }
}
