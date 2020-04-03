import 'package:flutter/material.dart';

import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberFieldController =
      TextEditingController();
  final TextEditingController _amountFieldController = TextEditingController();

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
              controller: _accountNumberFieldController,
              label: "Número da conta",
              hint: "0000"),
          Editor(
              controller: _amountFieldController,
              label: "Valor",
              hint: "0.00",
              icon: Icons.monetization_on),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => _createTransfer(context),
          )
        ],
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberFieldController.text);
    final double amount = double.tryParse(_amountFieldController.text);

    if (accountNumber != null && amount != null) {
      final createdTransfer = Transfer(amount, accountNumber);
      final snackBar = SnackBar(
        content: Text('$createdTransfer'),
        duration: Duration(milliseconds: 1000),
      );
      globalKey.currentState.showSnackBar(snackBar);

      Navigator.pop(context, createdTransfer);
    }
  }
}
