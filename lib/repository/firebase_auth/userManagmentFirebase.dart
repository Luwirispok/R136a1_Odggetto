import 'package:firebase_auth/firebase_auth.dart';

class UserManagementFirebaseAuth {
  ///Here need be a BLoC
  ///
  ///Here we management User behavior
  /*---------------------------------------------------*/

  ///Send email verefication URl
  sendVerificationEmail() async {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      user?.sendEmailVerification();
    });
  }

  ///Delete User from Datebase
  deleteUser() async {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      user?.delete();
    });
  }

  ///Update user Email adress
  updateUserEmail(email) async {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      user?.updateEmail(email);
    });
  }

  ///Sign Out user
  signOut(email) async {
    await FirebaseAuth.instance.signOut();
  }

  /*---------------------------------------------------*/
  ///Send at email link that reset password
  sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  /*---------------------------------------------------*/
}
