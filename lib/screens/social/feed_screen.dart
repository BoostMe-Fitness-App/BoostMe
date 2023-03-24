import 'package:boostme/utils/colors.dart';
import 'package:boostme/widgets/post_card.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

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
      body: const PostCard(),
    );
  }
}
