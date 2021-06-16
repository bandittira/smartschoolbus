import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_format/date_time_format.dart';

class BackgroundLog extends StatelessWidget {
  final Widget child;
  BackgroundLog({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate2 = DateFormat(' MMM, d').format(now);
    String formattedDate = DateFormat('E').format(now);
    String date = DateFormat('d').format(now);
    var day1 = now.day - 1;
    var day2 = now.day - 2;
    var day3 = now.day + 1;
    var day4 = now.day + 2;
    var day5 = now.day + 3;
    final testday = DateTime.now().subtract(Duration(days: 1)).format('D');
    final testday2 = DateTime.now().subtract(Duration(days: 2)).format('D');
    final testday3 = DateTime.now().subtract(Duration(days: -1)).format('D');
    final testday4 = DateTime.now().subtract(Duration(days: -2)).format('D');
    final testday5 = DateTime.now().subtract(Duration(days: -3)).format('D');
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 100,
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    child: TextButton(
                      onPressed: () => {
                        {Navigator.pop(context)}
                      },
                      child: Image.asset(
                          "assets/images/Icon/Register_icons/next2.png"),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
                    height: 60,
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Today",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 280,
                  ),
                  Container(
                    child: Text(
                      "$formattedDate2",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child:
                        Image.asset("assets/images/Log_file/calendar copy.png"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 190),
                child: Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                testday2.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade600),
                              ),
                              Text(
                                day2.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                testday.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade600),
                              ),
                              Text(
                                day1.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade600,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "$formattedDate",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                date,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                testday3,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade600),
                              ),
                              Text(
                                day3.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                testday4,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade600),
                              ),
                              Text(
                                day4.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                testday5,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade600),
                              ),
                              Text(
                                day5.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
