import 'package:flutter/material.dart';

import 'models/transferencia.dart';

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
      home: TransforForm(),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  const Editor({Key key, this.controller, this.label, this.hint, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            icon: Icon(icon),
            labelText: label,
            hintText: hint),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TransforForm extends StatelessWidget {
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
          Editor(controller: _accountNumberFieldController, label: "Número da conta", hint: "0000"),
          Editor(controller: _amountFieldController, label: "Valor", hint: "0.00", icon: Icons.monetization_on),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              debugPrint('clicou no confirmar');
              final int accountNumber =
                  int.tryParse(_accountNumberFieldController.text);
              final double amount = double.tryParse(_amountFieldController.text);

              if (accountNumber != null && amount != null) {
                final transferenciaCriada = Transfer(amount, accountNumber);
                debugPrint('$transferenciaCriada');
                final snackBar = SnackBar(
                  content: Text('$transferenciaCriada'),
                  duration: Duration(milliseconds: 1000),
                );
                globalKey.currentState.showSnackBar(snackBar);
              }
            },
          )
        ],
      ),
    );
  }
}

class TransfersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferências')),
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(100.0, 1000)),
          TransferItem(Transfer(200.0, 2000)),
          TransferItem(Transfer(300.0, 3000)),
          TransferItem(Transfer(400.0, 4000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransforForm()),
          );
        },
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.amount.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}
