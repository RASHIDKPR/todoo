import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoo/homepage.dart';

class TaskAdding extends StatefulWidget {
  final Function(Map<String, dynamic>) onAdd;

  const TaskAdding({Key? key, required this.onAdd}) : super(key: key);
  @override
  State<TaskAdding> createState() => _TaskAddingState();
}

class _TaskAddingState extends State<TaskAdding> {
  DateTime time = DateTime.now();
  DateTime currentDate = DateTime.now();
  bool switchValue = true;
  final TextEditingController timecontroller = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white70,
        leadingWidth: 100,
        leading: TextButton.icon(
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            icon: Container(
                width: 15, child: Icon(Icons.arrow_back_ios_new_rounded)),
            label: Container(
                width: 55,
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF007AFF),
                  ),
                ))),
        title: Center(
            child: Row(
          children: [
            SizedBox(
              width: 60,
            ),
            Text(
              'Task',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ],
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text(
                "Add a task",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                  height: 25 / 34,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 30,
                  width: 241,
                  child: Center(
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(),
                          labelText: 'Enter a Task',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff3c3c43),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Hour',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: 170,
                  child: CupertinoDatePicker(
                    initialDateTime: time,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() => time = newTime);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Today',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 200,
                ),
                CupertinoSwitch(
                  activeColor: Colors.green,
                  thumbColor: Colors.white,
                  trackColor: Colors.black12,
                  value: switchValue,
                  onChanged: (value) => setState(() => switchValue = value),
                ),
              ],
            ),
            // SizedBox(
            //   height: 30,
            // ),
            // Container(
            //   height: 80,
            //   width: 316,
            //   child: CupertinoDatePicker(
            //     initialDateTime: currentDate,
            //     onDateTimeChanged: (DateTime newDate) {
            //       print(newDate);
            //       setState(() {
            //         currentDate = newDate;
            //       });
            //     },
            //     use24hFormat: false,
            //     maximumDate: DateTime(2050),
            //     minimumYear: 2023,
            //     maximumYear: 2024,
            //     minuteInterval: 1,
            //     mode: CupertinoDatePickerMode.date,
            //   ),
            // ),

            SizedBox(
              height: 40,
            ),
            Center(
              child: GestureDetector(
                onTap: _onDonePressed,
                //  () {
                //   Navigator.pop(context, {
                //     'text': _textController.text,
                //     'time': time,
                //     'isToday': switchValue,
                //   });
                // },
                child: Container(
                  height: 46,
                  width: 316,
                  child: Center(
                      child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'If you disable today, the task will be considered as \n tomorrow',
              style: TextStyle(
                  fontSize: 13,
                  color: Color(0x993C3C43),
                  fontWeight: FontWeight.w400),
            ),
            //
          ],
        ),
      ),
      backgroundColor: Color(0xFFF7F8FA),
    );
  }

  void _onDonePressed() {
    Map<String, dynamic> newTask = {
      'name': _textController.text,
      'time': currentDate,
      'dueToday': switchValue,
    };

    widget.onAdd(newTask);

    _textController.clear();

    Navigator.of(context).pop({});
  }
}
