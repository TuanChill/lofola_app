import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final double borderRadius;
  final bool readOnly;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry outsidePadding;

  const TextInput({
    super.key,
    this.hintText = 'Input your text here',
    this.borderRadius = 16.0,
    this.readOnly = false,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    this.outsidePadding = const EdgeInsets.symmetric(horizontal: 0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outsidePadding,
      child: TextField(
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          contentPadding: contentPadding,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
