import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; //framework for app apple design
import 'package:stick_it/utils/dimensions.dart'; //dimensions of my application
import 'package:stick_it/utils/colors.dart'; //colors of my application
import 'package:http/http.dart' as http;
import 'dart:convert'; //json package conversion
import 'package:stick_it/utils/url.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  bool _EmailinUse = false;

  bool checking() {
    if (nameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      //TODO: rest of cheks -> email already exists?? do i check it now
      //-> psw min 8 char
      return true;
    } else {
      return false;
    }
  }

  // function to handle different errors reported b server
  void HandleError(response) {
    switch (response.statusCode) {
      case 401:
        setState(() {
          _EmailinUse = true;
        });
        break;
    }
  }

  void registerUser() async {
    var response;
    if (checking()) {
      var regBody = {
        "firstname": nameController.text,
        "lastname": lastNameController.text,
        "email": emailController.text,
        "password": passwordController.text
      };

      response = await http.post(Uri.parse(registrationUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      print(response.statusCode);
      setState(() {
        _isNotValidate = false;
      });
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }

    if (response.statusCode != 200) {
      HandleError(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> screenSizes = findSizes(context);

    double? width = screenSizes['canvasWidth'];
    double? halfWidth = screenSizes['halfWidth'];

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: halfWidth,
                          child: TextField(
                            controller:
                                nameController, // Assuming you have a different controller for password
                            keyboardType: TextInputType.text,
                            decoration: TextDecoration(_isNotValidate, "Name"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: halfWidth,
                          child: TextField(
                            controller:
                                lastNameController, // Assuming you have a different controller for password
                            keyboardType: TextInputType.text,
                            decoration:
                                TextDecoration(_isNotValidate, "Last Name"),
                          ),
                        )
                      ]),
                  const SizedBox(height: 10),
                  Container(
                    width: width,
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      decoration:
                          TextDecoration(_isNotValidate, "Email", _EmailinUse),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: width,
                    child: TextField(
                      controller:
                          passwordController, // Assuming you have a different controller for password
                      keyboardType: TextInputType.text,
                      decoration: TextDecoration(_isNotValidate, "Password"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Regiter',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
