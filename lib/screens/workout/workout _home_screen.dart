// ignore_for_file: file_names

import 'package:boostme/utils/colors.dart';
import 'package:boostme/widgets/post_card.dart';
import 'package:boostme/widgets/workout_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WorkoutHome extends StatelessWidget {
  const WorkoutHome({super.key});

  void navigateToWorkouts() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Image.asset(
          'assets/images/logo.png',
          color: Colors.blueAccent,
          height: 100,
          width: 101,
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.messenger_outline_sharp))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('workout').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => WorkoutList(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
