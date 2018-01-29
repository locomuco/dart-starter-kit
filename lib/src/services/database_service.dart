import 'dart:html';
import 'dart:async';

import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart' as fb;

@Injectable()
class DatabaseService {
  fb.Auth _fbAuth;
  fb.User user;
  fb.GoogleAuthProvider _fbGoogleAuthProvider;
  fb.Database _fbDatabase;
  fb.Storage _fbStorage;
  fb.DatabaseReference _fbRefMessages;

  DatabaseService() {
    fb.initializeApp(
      apiKey: "AIzaSyAXyuJv-CEaRcOkYRFV37jCjPPW4t0kdzk",
      authDomain: "dart-starter-kit.firebaseapp.com",
      databaseURL: "https://dart-starter-kit.firebaseio.com",
      projectId: "dart-starter-kit",
      storageBucket: "dart-starter-kit.appspot.com",
    );
    _fbGoogleAuthProvider = new fb.GoogleAuthProvider();
    _fbAuth = fb.auth();
    _fbAuth.onAuthStateChanged.listen(_authChanged);
  }

  void _authChanged(fb.User fbUser) {
    user = fbUser;
  }

  Future signIn() async {
    try {
      await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
    } catch (error) {
      print("$runtimeType::login() -- $error");
    }
  }

  void signOut() {
    _fbAuth.signOut();
  }
}
