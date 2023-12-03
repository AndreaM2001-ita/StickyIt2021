import 'package:flutter/material.dart';
import 'package:stick_it/utils/colors.dart'; //colors of my application

const List<Capsula> CapsuleList = [];

class Capsula extends StatelessWidget {
  final String title;
  final Image image;

  const Capsula(this.title, this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 5.0),
        alignment: FractionalOffset.center,
        width: (MediaQuery.of(context).size.width),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: secondaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(children: [
          Container(
            height: 90.0,
            width: 90.0,
            decoration: buildContainerDecoration(),
            child: image,
          ),
          Expanded(
            child: Container(
              height: 90.0,
              width: 120.0,
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
