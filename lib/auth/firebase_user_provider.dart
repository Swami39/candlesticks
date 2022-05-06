import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CandelstickFirebaseUser {
  CandelstickFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

CandelstickFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CandelstickFirebaseUser> candelstickFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<CandelstickFirebaseUser>(
        (user) => currentUser = CandelstickFirebaseUser(user));
