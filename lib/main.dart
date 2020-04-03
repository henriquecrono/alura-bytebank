import 'package:flutter/material.dart';

import 'package:bytebank/screens/transferencia/list.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ByteBank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransfersList(),
    );
  }
}
