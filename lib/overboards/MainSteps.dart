import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class MainSteps extends StatefulWidget {
  final data;
  MainSteps(this.data);

  @override
  _MainStepsState createState() => _MainStepsState();
}

class _MainStepsState extends State<MainSteps> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _globalKey,
        body: Container(
          child: OverBoard(
            pages: [
              PageModel.withChild(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Image.network(
                      "http://surekhadesigns.in/json/Banner/1590144701.png",
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  doAnimateChild: false),
              PageModel.withChild(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Image.network(
                      "http://surekhadesigns.in/json/Banner/1590144723.png",
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  doAnimateChild: false),
              PageModel.withChild(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Image.network(
                      "http://surekhadesigns.in/json/Banner/1590144745.png",
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  doAnimateChild: false),
              PageModel.withChild(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Image.network(
                      "http://surekhadesigns.in/json/Banner/1590144767.png",
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  doAnimateChild: false),
              PageModel.withChild(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Image.network(
                      "http://surekhadesigns.in/json/Banner/1590144701.pngs",
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  doAnimateChild: false),
            ],
            showBullets: true,
            skipText: "",
            skipCallback: () {
              _globalKey.currentState.showSnackBar(SnackBar(
                content: Text("Skip clicked"),
              ));
            },
          ),
        ));
  }
}
