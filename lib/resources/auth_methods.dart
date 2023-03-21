import 'dart:typed_data';
import 'package:boostme/resources/storage_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //signup the user
  //Future return type is used because all the calls are made to the Firebase are async
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file, //Uint8List is the file type
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'userName': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'photoUrl': photoUrl,
        });

        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
