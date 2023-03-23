import 'package:boostme/screens/social/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  Text('Feed'),
  Text('Search'),
  AddPostScreen(),
  Text('Feed'),
  Text('Feed'),
];
