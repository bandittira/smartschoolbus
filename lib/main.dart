import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:smartschoolbus/screens/sign_in/components/auth.dart';
import 'package:smartschoolbus/wrapper.dart';
import 'package:smartschoolbus/screens/sign_in/components/user.dart';

import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Socket socket;
String _errorData;
String _secureResponse;

Future<String> sendRequest(String _request) async {
  var _completer = Completer<String>();
  _errorData = 'Server_Error';
  if (_request != null) {
    Socket _socket;
    await Socket.connect('192.168.1.108', 12345).then((socket) {
      _socket = socket;
    });
    _socket.listen((data) {
      _secureResponse = utf8.decode(data);
      _completer.complete(_secureResponse);
    },
    onError: ((error, StackTrace trace) {
      _secureResponse = _errorData;
      _completer.completeError(_secureResponse);
    }),
    onDone: () {
      _socket.destroy();
      exit(0);
    },
    cancelOnError: false);
    _socket.write('$_request');
  } else {
    _secureResponse = _errorData;
  }
  return _completer.future;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Firebaseusertest>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
