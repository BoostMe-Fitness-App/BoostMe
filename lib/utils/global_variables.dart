import 'package:boostme/screens/social/add_post.dart';
import 'package:boostme/screens/workout/workout_welcome.dart';
import 'package:flutter/material.dart';

const webScreenSize = 600;

// List<Widget> homeScreenItems = [
//  // const FeedScreen(),
//  // const SearchScreen(),
//   const AddPostScreen(),
//   const Text('notifications'),
//   // ProfileScreen(
//   //   uid: FirebaseAuth.instance.currentUser!.uid,
//   // ),
// ];

const homeScreenItems = [
  Text('Home'),
  AddPostScreen(),
  WorkoutWelcomeScreen(),
  Text('Nutrition'),
  Text('Yoga'),
  Text('Profile'),
];
