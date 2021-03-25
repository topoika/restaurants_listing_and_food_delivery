import 'package:flutter/material.dart';

import '../../../theme_data.dart';

InputDecoration authTextInputDecoration(String hintText) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.black54,
      fontFamily: MyColors.primaryFont,
    ),
  );
}
