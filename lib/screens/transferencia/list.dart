import 'package:flutter/material.dart';

import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transferencia/form.dart';

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  _TransfersListState createState() => _TransfersListState();
}

class _TransfersListState extends State<TransfersList> {
  static const _appBarTitle = 'Transferências';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_appBarTitle)),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];

          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future = Navigator.push(
              context, MaterialPageRoute(builder: (context) => TransferForm()));

          future.then((receivedTransfer) {
            if (receivedTransfer != null) update(receivedTransfer);
          });
        },
      ),
    );
  }

  void update(Transfer receivedTransfer) {
    return setState(() {
      widget._transfers.add(receivedTransfer);
    });
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
