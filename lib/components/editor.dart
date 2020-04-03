import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  const Editor({Key key, this.controller, this.label, this.hint, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: label,
            hintText: hint),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
