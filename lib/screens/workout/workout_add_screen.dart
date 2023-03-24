import 'dart:typed_data';
import 'package:boostme/providers/user_provider.dart';
import 'package:boostme/resources/firestore_methods.dart';
import 'package:boostme/responsive/mobile_screen_layout.dart';
import 'package:boostme/utils/colors.dart';
import 'package:boostme/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WorkoutAddScreen extends StatefulWidget {
  const WorkoutAddScreen({Key? key}) : super(key: key);

  @override
  _WorkoutAddScreenState createState() => _WorkoutAddScreenState();
}

class _WorkoutAddScreenState extends State<WorkoutAddScreen> {
  final TextEditingController _exName = TextEditingController();
  final TextEditingController _exWeight = TextEditingController();
  final TextEditingController _exSets = TextEditingController();
  final TextEditingController _exReps = TextEditingController();
  final TextEditingController _exDate = TextEditingController();

  void saveExercise(String uid) async {
    // start the loading
    try {
      // upload to storage and db
      String res = await FirestoreMethods().addExercise(uid, _exName.text,
          _exWeight.text, _exSets.text, _exReps.text, _exDate.text);
      if (res == "success") {
        // showSnackBar(
        //   context as String,
        //   'Posted!' as BuildContext,
        // );
      } else {
        // showSnackBar(context as String, res as BuildContext);
      }
    } catch (err) {
      // showSnackBar(
      //   context as String,
      //   err.toString() as BuildContext,
      // );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _exName.dispose();
    _exWeight.dispose();
    _exSets.dispose();
    _exReps.dispose();
    _exDate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const MobileScreenLayout(),
            //   ),
            // );
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add Exercise',
        ),
        centerTitle: false,
        actions: <Widget>[
          TextButton(
            onPressed: () => saveExercise(
              userProvider.getUser!.uid,
            ),
            child: const Text(
              "Save",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          )
        ],
      ),
      // POST FORM
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _exName,
                  decoration:
                      const InputDecoration(label: Text('Exercise Name')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _exWeight,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Weight')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _exReps,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Reps Count')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _exSets,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('Sets Count')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _exDate,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Select Date" //label text of field
                      ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        _exDate.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
