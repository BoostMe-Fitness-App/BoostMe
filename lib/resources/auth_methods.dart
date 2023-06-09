import 'dart:typed_data';
import 'package:boostme/resources/storage_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:boostme/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User?> getUserDetails() async {
    User? currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  //signup the user
  //Future return type is used because all the calls are made to the Firebase are async
  Future<String> signUpUser({
    required String email,
    required String password,
     String ?username,
    required String bio,
    required Uint8List file, //Uint8List is the file type
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username!.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

//create user model
        model.User user = model.User(
            username: username,
            email: email,
            uid: cred.user!.uid,
            photoUrl: photoUrl,
            bio: bio,
            followers: [],
            following: []);
        //add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );

        res = 'success';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'The email is badly formatted';
      } else if (err.code == 'weak password ') {
        res = 'Password should be atleast 6 charactors';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please enter all fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
