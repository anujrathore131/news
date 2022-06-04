

import 'package:flutter/material.dart';

import '../main.dart';

class StatusDialog extends StatefulWidget {
  const StatusDialog({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return StatusDialogState();
  }
}

class StatusDialogState extends State<StatusDialog> {
  String _selectedText = "general";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Category Filter"),
      content: DropdownButton<String>(
        hint: const Text("Category"),
        value: _selectedText,
        items: <String>['business','entertainment','general','health','science','sports','technology']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String val) {
          setState(() {
            _selectedText = val;
          });
        },
      ),
      actions: <Widget>[
        ElevatedButton(

          child: const Text("APPLY"),
          style: ElevatedButton.styleFrom(
            primary: Colors.red
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  NewsData(category: _selectedText,)));
          },
        ),
      ],
    );
  }
}

