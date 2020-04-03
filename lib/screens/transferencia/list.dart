import 'package:flutter/material.dart';

import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transferencia/form.dart';

class TransfersList extends StatelessWidget {
  final List<Transfer> _transfers = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferências')),
      body: ListView.builder(
        itemCount: _transfers.length,
        itemBuilder: (context, index) {
          final transfer = _transfers[index];

          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future = Navigator.push(
              context, MaterialPageRoute(builder: (context) => TransferForm()));

          future.then((receivedTransfer) {
            debugPrint('Transferência recebida');
            debugPrint('$receivedTransfer');
            _transfers.add(receivedTransfer);
          });
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
