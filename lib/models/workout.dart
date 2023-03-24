import 'package:cloud_firestore/cloud_firestore.dart';

class Workout {
  final String exName;
  final String uid;
  final String exWeight;
  final String exReps;
  final String exSets;
  final String exDate;

  const Workout({
    required this.exName,
    required this.exWeight,
    required this.exReps,
    required this.exSets,
    required this.exDate,
    required this.uid,
  });

  static Workout fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Workout(
      uid: snapshot["uid"],
      exDate: snapshot['exDate'],
      exReps: snapshot['exReps'],
      exName: snapshot['exName'],
      exWeight: snapshot['exWeight'],
      exSets: snapshot['exSets'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        'exDate': exDate,
        'exReps': exReps,
        'exName': exName,
        'exWeight': exWeight,
        'exSets': exSets
      };
}
