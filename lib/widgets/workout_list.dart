import 'package:boostme/providers/user_provider.dart';
import 'package:boostme/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boostme/models/user.dart' as model;

class WorkoutList extends StatefulWidget {
  final snap;
  const WorkoutList({
    super.key,
    required this.snap,
  });

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  @override
  Widget build(BuildContext context) {
    final model.User? user = Provider.of<UserProvider>(context).getUser;

    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                "Exercise Name : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.snap['exName']}",
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Total Weight : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.snap['exWeight']}Kg",
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Sets Count : ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.snap['exSets']}",
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              // ignore: prefer_const_constructors
              Text(
                "Reps Count : ",
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.snap['exReps']}",
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
