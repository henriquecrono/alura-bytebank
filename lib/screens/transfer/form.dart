import 'package:flutter/material.dart';

import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';

class TransferForm extends StatefulWidget {
  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberFieldController =
      TextEditingController();

  final TextEditingController _amountFieldController = TextEditingController();

  // final globalKey = GlobalKey<ScaffoldState>();

  static const _appBarTitle = 'Criando Transferência';

  static const _labelAccountNumber = 'Número da conta';
  static const _hintAccountNumber = '0000';

  static const _labelAmount = 'Valor';
  static const _hintAmount = '0.00';
  static const _hintIcon = Icons.monetization_on;

  static const _txtConfirmButton = 'Confirmar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: globalKey,
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _accountNumberFieldController,
              label: _labelAccountNumber,
              hint: _hintAccountNumber,
            ),
            Editor(
              controller: _amountFieldController,
              label: _labelAmount,
              hint: _hintAmount,
              icon: _hintIcon,
            ),
            RaisedButton(
              child: Text(_txtConfirmButton),
              onPressed: () => _createTransfer(context),
            )
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberFieldController.text);
    final double amount = double.tryParse(_amountFieldController.text);

    if (accountNumber != null && amount != null) {
      final createdTransfer = Transfer(amount, accountNumber);
      // final snackBar = SnackBar(
      //   content: Text('$createdTransfer'),
      //   duration: Duration(milliseconds: 1000),
      // );
      // globalKey.currentState.showSnackBar(snackBar);

      Navigator.pop(context, createdTransfer);
    }
  }
}
