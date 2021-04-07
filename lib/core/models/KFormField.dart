import 'package:flutter/material.dart';

class KFormField {
  @required
  TextInputType keyboardType;
  @required
  String hint;
  bool obscureText;
  bool enableSuggestions;
  bool autocorrect;

  KFormField({
    this.keyboardType,
    this.hint,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
  });
}

class KFormFieldWidget extends StatelessWidget {
  final KFormField kFormField;
  final Function validator;
  final Function save;

  KFormFieldWidget({
    this.save,
    this.kFormField,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.pinkAccent,
      keyboardType: this.kFormField.keyboardType,
      obscureText: this.kFormField.obscureText,
      enableSuggestions: this.kFormField.enableSuggestions,
      autocorrect: this.kFormField.autocorrect,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        hintText: this.kFormField.hint,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pinkAccent),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      validator: (value) => this.validator(value),
      onSaved: (value) {
        this.save(value);
      },
    );
  }
}
