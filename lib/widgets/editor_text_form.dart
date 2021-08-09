import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  Editor(
      {required TextEditingController textEditingController,
      required String labelText,
      String? hintText,
      Icon? icon})
      : _textEditingController = textEditingController,
        _labelText = labelText,
        _hintText = hintText,
        _icon = icon;

  final TextEditingController _textEditingController;
  final String _labelText;
  final String? _hintText;
  final Icon? _icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            labelText: _labelText, hintText: _hintText, icon: _icon),
      ),
    );
  }
}
