import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String keyString;
  final String labelText;
  final String helperText;
  final Function(String text) onNumberChanged;

  CustomInputField(
      this.keyString, this.labelText, this.helperText, this.onNumberChanged);

  InputDecoration _getTextDecoration(String labelText, String helperText) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(16.0),
      labelText: labelText,
      helperText: helperText,
      border: OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: TextFormField(
          key: Key(keyString),
          decoration: _getTextDecoration(labelText, helperText),
          keyboardType: TextInputType.number,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          onChanged: (text) => onNumberChanged(text)),
    );
  }
}
