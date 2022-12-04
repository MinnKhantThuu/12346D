import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TextInput extends StatelessWidget {
  final bool obsecureText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final Function? suffixIconClick;
  final Function? validation;

  TextInput({
    Key? key,
    this.obsecureText: false,
    required this.controller,
    this.textInputType: TextInputType.text,
    this.textInputAction: TextInputAction.done,
    this.hintText: '',
    this.icon,
    this.suffixIcon,
    this.suffixIconClick,
    this.validation,
  }) : super(key: key);

  OutlineInputBorder outlineInputBorder({
    double radius: 5,
    double width: 0,
  }) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: SECONDARY_COLOR,
          width: width,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      obscuringCharacter: '*',
      obscureText: obsecureText,
      controller: controller,
      textAlign: TextAlign.start,
      cursorHeight: 25,
      cursorColor: Color(0xff1C1E50),
      showCursor: true,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Fira',
        letterSpacing: 1.2,
      ),
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(
          minHeight: 32,
          minWidth: 32,
        ),
        // contentPadding: EdgeInsets.symmetric(
        //   horizontal: 30,
        // ),
        fillColor: SECONDARY_COLOR,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Myanmar',
          fontSize: 16,
          // color: Colors.white,
        ),
        prefixIcon: icon == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  icon,
                  size: 30,
                  color: Color(0xff1C1E50),
                ),
              ),
        suffixIcon: suffixIcon == null
            ? null
            : InkWell(
                onTap: () {
                  suffixIconClick!();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    suffixIcon,
                    size: 30,
                    color: Color(0xff1C1E50),
                  ),
                ),
              ),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
      ),
    );
  }
}
