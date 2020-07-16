import 'package:firebase_auth/firebase_auth.dart';
import 'package:reserve_it/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
// create a user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user Stream
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

//sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//sign in with email and password

//register with email and password

// sign out

}