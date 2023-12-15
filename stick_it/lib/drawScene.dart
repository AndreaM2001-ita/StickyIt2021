import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; //framework for app apple design
import 'package:stick_it/utils/colors.dart'; //colors of my application
import 'package:stick_it/utils/dimensions.dart'; //dimensions of my application
import 'package:stick_it/Painter.dart';

//import 'dart:ui' as ui;

class drawScene extends StatelessWidget {
  const drawScene({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StickIt',
      theme: ThemeData.light()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home:
          const drawPage(), //const ResponsiveLayout(mobileScreenLayout: mobileScreenLayout()),
    );
  }
}

class drawPage extends StatefulWidget {
  const drawPage({super.key});

  @override
  State<drawPage> createState() => _MyDrawPageState();
}

class _MyDrawPageState extends State<drawPage> {
  List<Offset> points = [];

  @override
  void initState() {
    super.initState();
  }

  void _capture() {}

  @override
  Widget build(BuildContext context) {
    Map<String, double> screenSizes = findSizes(context);

    double? canvasHeight =
        screenSizes['height'] != null ? screenSizes['height']! : 800;

    double brushContainerSize = canvasHeight / 5;

    return CupertinoPageScaffold(
      child: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              //SizedBox(height: canvasHeight /30),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: mobileSearchColor,
                  ),
                  child: Text('DRAW YOUR IMAGE'),
                ),
              ),
              SizedBox(height: canvasHeight / 50),
              Container(
                  height: screenSizes['canvasWidth'],
                  width:
                      screenSizes['canvasWidth'], // Adjust the width as needed
                  decoration: buildContainerDecoration(),
                  child: _canvas(screenSizes['canvasWidth'])),
              SizedBox(height: canvasHeight / 30),
              ElevatedButton(
                onPressed: _capture,
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
                    'Save',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: brushContainerSize,
                  width:
                      screenSizes['canvasWidth'], // Adjust the width as needed
                  decoration: buildContainerDecoration(),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  /*void _capture() async {
    final bytes1 = await Utils.capture(key1, setName());
    setState(() {
      this.bytes1 = bytes1;
      Content c = new Content(setName(), buildImage(bytes1));
      CapsuleList.add(c);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => mobileScreenLayout()),
        (Route<dynamic> route) => false,
      );
    });
  }*/

  Widget _canvas(double? screenSizes) {
    return GestureDetector(
      onPanStart: (details) {
        setState(() {
          points.add(details.localPosition);
        });
      },
      onPanUpdate: (details) {
        setState(() {
          points.add(details.localPosition);
        });
      },
      onPanEnd: (details) {
        setState(() {
          points.add(const Offset(-1, -1));
        });
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: CustomPaint(painter: Painter(points, screenSizes)),
      ),
    );
  }
}
