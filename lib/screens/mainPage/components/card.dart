import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class CardStatus extends StatelessWidget {
  String title;
  Color colordot;
  Color colorcon;

  CardStatus(this.title, this.colordot, this.colorcon);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50),
      height: 100,
      child: Row(
        children: [
          Text(
            "7:30 AM",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            width: 10,
          ),
          DotIndicator(
            child: Container(
              decoration: BoxDecoration(
                  color: colordot, borderRadius: BorderRadius.circular(20)),
              width: 15,
              height: 15,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
                color: colorcon,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 1)),
                ]),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 10, left: 15),
                  height: 20,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 65,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Image.asset("assets/images/Main/student.png"),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Image.asset("assets/images/Main/peruvian.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
