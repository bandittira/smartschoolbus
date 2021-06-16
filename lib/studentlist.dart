import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/student_list/student_list.dart';

class stList extends StatelessWidget {
  String title;

  stList(this.title);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => studentList()),
        ),
      },
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple.shade100),
            child: Icon(
              Icons.list,
              size: 30,
              color: Colors.purple.shade300,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
          ),
          SizedBox(
            width: 112,
          ),
          TextButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => studentList()),
              ),
            },
            child: Icon(Icons.navigate_next_rounded),
          ),
        ],
      ),
    );
  }
}
