import 'package:flutter/material.dart';

class KSearchField extends StatelessWidget {
  KSearchField(
      {this.hintText,
      this.height = 47.0,
      this.width,
      this.validator,
      this.emptyValidator = false,
      this.emptyValidatorMsg = "Should not be empty",
      this.textInputType,
      this.maxLength,
      this.controller,
      this.onSearchTap,
      this.onChanged,
      this.obscureText = false});

  final String hintText;
  final double height;
  final double width;
  final TextEditingController controller;
  final Function validator;
  final bool emptyValidator;
  final String emptyValidatorMsg;
  final TextInputType textInputType;
  final int maxLength;
  final bool obscureText;
  final void Function(String) onSearchTap;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 0.0, left: 5.0, right: 5.0),
      height: height,
      color: Colors.white,
      child: TextField(
          maxLines: 1,
          maxLength: maxLength,
          controller: controller,
          keyboardType: textInputType,
          onSubmitted: (value) => onSearchTap(controller.text),
          onChanged: (value) => onChanged(value),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.only(top: 5.0, left: 15.0),
            hintStyle: new TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.85),
            suffixIcon: InkWell(
              child: Icon(
                Icons.search,
                size: 30.0,
              ),
              onTap: () => onSearchTap(controller.text),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Color(0xFFF1EDED),
                  width: 0.7),
            ),
          )),
    );
  }
}
