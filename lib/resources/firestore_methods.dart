import 'dart:typed_data';

import 'package:boostme/models/post.dart';
import 'package:boostme/models/workout.dart';
import 'package:boostme/resources/storage_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String? username,
    String profImage,
  ) async {
    String res = 'Some error occured';
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username!,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );
      _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, String likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  //add workout

  Future<String> addExercise(
    String exName,
    String uid,
    String exWeight,
    String exReps,
    String exSets,
    String exDate,
  ) async {
    String res = 'Some error occured';
    try {
      String exId = const Uuid().v1();
      Workout workout = Workout(
        uid: uid,
        exName: exName,
        exDate: exDate,
        exWeight: exWeight,
        exReps: exReps,
        exSets: exSets,
      );
      _firestore.collection('workout').doc(exId).set(
            workout.toJson(),
          );
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
