import 'package:flutter/material.dart';
import 'package:smartschoolbus/screens/log_file/components/body.dart';

class LogFile extends StatefulWidget {
  @override
  _LogFileState createState() => _LogFileState();
}

class _LogFileState extends State<LogFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}
