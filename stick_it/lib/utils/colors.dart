import 'package:flutter/material.dart';

const mobileBackgroundColor = Color.fromRGBO(249, 249, 249, 1);
const webBackgroundColor = Color.fromRGBO(18, 18, 18, 1);
const mobileSearchColor = Color.fromRGBO(38, 38, 38, 1);
const blueColor = Color.fromRGBO(0, 149, 246, 1);
const primaryColor = Colors.white;
const secondaryColor = Colors.grey;
const drawingColor = Color.fromARGB(255, 136, 134, 233);
const buttonColor = Color.fromARGB(255, 148, 6, 243);

BoxDecoration buildContainerDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: secondaryColor,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(5)),
  );
}

InputDecoration TextDecoration(bool isNotValidate, String info,
    [bool? EmailinUse]) {
  return InputDecoration(
    filled: true,
    fillColor: primaryColor,
    errorStyle: const TextStyle(color: webBackgroundColor),
    errorText: (isNotValidate)
        ? "Enter valid $info"
        : (EmailinUse != null && EmailinUse)
            ? "Email is already in use"
            : null,
    hintText: info,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
}
