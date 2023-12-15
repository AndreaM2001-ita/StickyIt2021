import 'package:flutter/material.dart';
import 'package:stick_it/utils/colors.dart'; //colors of my application
import 'package:stick_it/utils/dimensions.dart'; //dimensions of my application

const List<Capsula> CapsuleList = [];

class Capsula extends StatelessWidget {
  final String title;
  final Image image;

  const Capsula(this.title, this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> screenSizes = findSizes(context);

    double? canvasWidth =
        screenSizes['canvasWidth'] != null ? screenSizes['canvasWidth']! : 800;

    double? picSize =
        screenSizes['picSize'] != null ? screenSizes['picSize']! : 90;
    return Container(
        margin: const EdgeInsets.only(left: 5.0),
        alignment: FractionalOffset.center,
        width: (canvasWidth),
        padding: const EdgeInsets.all(5.0),
        decoration: buildContainerDecoration(),
        child: Row(children: [
          Container(
            height: picSize,
            width: picSize,
            decoration: buildContainerDecoration(),
            child: image,
          ),
          Expanded(
            child: Container(
              height: picSize,
              width: canvasWidth - picSize,
              child: Center(
                child: Text(title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: mobileSearchColor,
                    )),
              ),
            ),
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Tab(
                child: IconButton(
                  icon: const Icon(
                    Icons.upload,
                  ),
                  onPressed: () {},
                ),
              ),
              //SizedBox(width: 5.0),
              Tab(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_right,
                  ),
                  onPressed: () {
                    //Navigator.push(
                    //context,
                    //MaterialPageRoute(builder: (context) => Draw(title)),
                    //);
                  },
                ),
              )
            ]),
          )
        ]));
  }
}
