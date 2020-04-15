import 'package:flutter/material.dart';

import 'package:bytebank/components/card_menu.dart';

import 'package:bytebank/screens/transfer/list.dart';
import 'package:bytebank/screens/contacts/list.dart';

class Dashboard extends StatelessWidget {
  static const _appBarTitle = 'Dashboard';

  static const _srcLogoByteBank = 'images/bytebank_logo.png';

  static const _contactsCardIcon = Icons.people;
  static const _contactsCardTitle = 'Contacts';

  static const _transferListCardIcon = Icons.attach_money;
  static const _transferListCardTitle = 'Transfers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(_srcLogoByteBank),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CardMenu(
                  cardIcon: _transferListCardIcon,
                  cardTitle: _transferListCardTitle,
                  cardPageRoute: TransfersList(),
                ),
                CardMenu(
                  cardIcon: _contactsCardIcon,
                  cardTitle: _contactsCardTitle,
                  cardPageRoute: ContactsList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
