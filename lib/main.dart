// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, duplicate_ignore

import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino'),
        backgroundColor: CupertinoColors.systemGrey,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: _dateTime,
                onDateTimeChanged: (dateTime) {
                  print(dateTime);
                  setState(() {
                    _dateTime = dateTime;
                  });
                },
              ),
            ),
            CupertinoButton(
              child: Text('Confirm'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text('Date and Time you selected'),
                    content: Text(
                        '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}\n${_dateTime.hour}:${_dateTime.minute}'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
