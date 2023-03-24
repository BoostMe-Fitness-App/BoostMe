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
      child: Container(
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color.fromARGB(255, 60, 2, 2),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 233, 233, 233),
                blurRadius: 10.0,
                spreadRadius: 10.0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.snap['exDate'],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.snap['exName'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Row(
                children: [
                  Chip(
                    label: Text("${widget.snap['exWeight']}kg"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Chip(
                    label: Text("${widget.snap['exSets']}sets"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Chip(
                    label: Text("${widget.snap['exReps']}reps"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
