import 'package:flutter/material.dart';

import 'package:bytebank/screens/transferencia/list.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  static const _appName = 'ByteBank';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appName,
      theme: ThemeData(
        primarySwatch: Colors.green,
        // brightness: Brightness.dark,
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: TransfersList(),
    );
  }
}
