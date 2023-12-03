import 'package:flutter/material.dart';
import 'package:stick_it/utils/colors.dart'; //colors of my application
import 'package:stick_it/utils/icons.dart'; //icons list of application
import 'package:stick_it/Capsula.dart';
import 'package:stick_it/drawScene.dart';
import 'package:flutter/cupertino.dart'; //framework for app apple design

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ListPage> {
  void _newImage() {
    setState(() {
      //create new image??
    });
  }

  void _delete() {
    setState(() {
      //delete all images
    });
  }

  void _switchScene() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const drawScene()),
    );
  }

  Widget chooseState() {
    if (CapsuleList.isEmpty) {
      return Center(
          child: SafeArea(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0), // Add padding as needed
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: mobileSearchColor,
                ),
                child: Text('CREATE YOUR FIRST IMAGE'),
              ),
            ),
            // Spacer or SizedBox to push the next widget to the center
            Expanded(
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.draw,
                    size: 200,
                    color: drawingColor,
                  ),
                  highlightColor: Colors.pink,
                  onPressed: () => _switchScene(),
                ),
              ),
            ),
          ],
        ),
      ));
    } else {
      return Padding(
          padding: EdgeInsets.all(10.0),
          child: SafeArea(
              child: Column(children: <Widget>[
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('LAST STICKY NOTE SENT',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: mobileSearchColor,
                  )),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Capsula(
                CapsuleList[CapsuleList.length - 1].title,
                CapsuleList[CapsuleList.length - 1].image,
              ),
            )
          ])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        //top menu bar
        navigationBar: CupertinoNavigationBar(
            automaticallyImplyMiddle: false,
            leading: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: _delete,
                child: const Icon(Icons.delete_outlined, size: 35)),
            middle: const Text('Stick It'),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _newImage,
              child: const Icon(MyFlutterFont.up_circled),
            )),
        //body of the list
        child: chooseState()

        /*,
            if (!_CapsuleList.isEmpty)
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Content(CapsuleList[CapsuleList.length - 1].title,
                    CapsuleList[CapsuleList.length - 1].im),
              ),
            SizedBox(height: 25.0),
            new Align(
              alignment: Alignment.centerLeft,
              child: new Text('OTHER STICKY NOTES',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: mobileSearchColor,
                  )),
            ),
            SizedBox(height: 15.0),
            if (!_CapsuleList.isEmpty) CapsulaList(),*/
        );
  }
}
