import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final IconData cardIcon;
  final String cardTitle;
  final Widget cardPageRoute;

  const CardMenu({Key key, this.cardTitle, this.cardIcon, this.cardPageRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            (MaterialPageRoute(
              builder: (context) => cardPageRoute,
            )),
          );
        },
        child: Container(
          height: 100,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  cardIcon,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                  cardTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
