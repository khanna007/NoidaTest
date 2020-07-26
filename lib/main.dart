import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:testcompanynoida/overboards/MainSteps.dart';
import 'package:testcompanynoida/web/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rating = 4.0;
  int _value = 0;
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  Future userDetails;

  Future fetchBookings() async {
    try {
      var response = await http().get('Udashboard.php?id=36');

      return response.data;
    } catch (e) {}
  }

  @override
  void initState() {
    userDetails = fetchBookings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            child: new FutureBuilder(
              future: userDetails,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return details(context, snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }

  Widget details(BuildContext context, data) {
    return Container(
      child: Container(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .52,
                  child: MainSteps(data),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .48),
                      width: MediaQuery.of(context).size.width * .9,
                      height: 310,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Straight cut suits",
                                        style: TextStyle(
                                            color: Color(0xFF921C04),
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22),
                                      ),
                                      Spacer(),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          FontAwesomeIcons.heart,
                                          color: Colors.redAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Wrap(
                                      children: <Widget>[
                                        Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: <Widget>[
                                        SmoothStarRating(
                                          rating: rating,
                                          size: 30,
                                          color: Colors.yellow[900],
                                          filledIconData: Icons.star,
                                          halfFilledIconData: Icons.star_half,
                                          defaultIconData: Icons.star_border,
                                          starCount: 5,
                                          allowHalfRating: true,
                                          spacing: 1.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                        ),
                                        Text(
                                          "(1651)",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "\$1500",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                        ),
                                        Text(
                                          '\$2500',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w700,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                        ),
                                        Text(
                                          '30% Off',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey[500],
                                    thickness: 2,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "Size",
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20),
                                        ),
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Text(
                                            "Size chart",
                                            style: TextStyle(
                                                color: Colors.blue[800],
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () =>
                                              setState(() => _value = 0),
                                          child: Container(
                                            height: 56,
                                            width: 56,
                                            color: _value == 0
                                                ? Color(0xFF5E1303)
                                                : Colors.transparent,
                                            child: Center(
                                              child: Text(
                                                "S",
                                                style: TextStyle(
                                                    color: _value == 0
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        GestureDetector(
                                          onTap: () =>
                                              setState(() => _value = 1),
                                          child: Container(
                                            height: 56,
                                            width: 56,
                                            color: _value == 1
                                                ? Color(0xFF5E1303)
                                                : Colors.transparent,
                                            child: Center(
                                              child: Text(
                                                "XS",
                                                style: TextStyle(
                                                    color: _value == 1
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        GestureDetector(
                                          onTap: () =>
                                              setState(() => _value = 2),
                                          child: Container(
                                            height: 56,
                                            width: 56,
                                            color: _value == 2
                                                ? Color(0xFF5E1303)
                                                : Colors.transparent,
                                            child: Center(
                                              child: Text(
                                                "S",
                                                style: TextStyle(
                                                    color: _value == 2
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        GestureDetector(
                                          onTap: () =>
                                              setState(() => _value = 3),
                                          child: Container(
                                            height: 56,
                                            width: 56,
                                            color: _value == 3
                                                ? Color(0xFF5E1303)
                                                : Colors.transparent,
                                            child: Center(
                                              child: Text(
                                                "S",
                                                style: TextStyle(
                                                    color: _value == 3
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        GestureDetector(
                                          onTap: () =>
                                              setState(() => _value = 4),
                                          child: Container(
                                            height: 56,
                                            width: 56,
                                            color: _value == 4
                                                ? Color(0xFF5E1303)
                                                : Colors.transparent,
                                            child: Center(
                                              child: Text(
                                                "S",
                                                style: TextStyle(
                                                    color: _value == 4
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .90),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                          ),
                          Text(
                            "Available Offers",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 70, top: 10),
                          ),
                          Text(
                            "5% intant Discount by Paying Online",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 60),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 70),
                          ),
                          Text(
                            "5% intant Discount by Paying Online",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 60),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Container(
                        height: 65.0,
                        width: 350,
                        color: Color(0xFF5E1303),
                        child: RaisedButton(
                          child: Center(
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      Container(
                        height: 65.0,
                        width: 350,
                        color: Color(0xFF5E1303),
                        child: RaisedButton(
                          child: Center(
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Divider(
                        color: Colors.grey[500],
                        thickness: 5,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                ),
                                Text(
                                  "Deliver to ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Text(
                                  "New Delhi -100011",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 40),
                                  ),
                                  Icon(
                                    Icons.directions_car,
                                    color: Colors.blue[900],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Text(
                                    "Free| ",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Delivery in 5-7 days",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(right: 60),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 40),
                                  ),
                                  Icon(
                                    Icons.directions_car,
                                    color: Colors.blue[900],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Text(
                                    "Cash on Deleivery Availabe",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(right: 60),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 40),
                                  ),
                                  Icon(
                                    Icons.directions_car,
                                    color: Colors.blue[900],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Text(
                                    "14 days return policy",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(right: 60),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Divider(
                              color: Colors.grey[500],
                              thickness: 5,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 10, right: 20, top: 10),
                              height: 700,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 20),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "Similar products",
                                            style: TextStyle(
                                                color: Color(0xFF921C04),
                                                fontWeight: FontWeight.w900,
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 20),
                                      height: 300,
                                      child: Card(
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: numbers.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                  child: Container(
                                                      child: Column(
                                                    children: <Widget>[
                                                      Image.network(
                                                        "http://surekhadesigns.in/json/Product/5951593584625_M.jpg",
                                                        height: 120,
                                                        width: 200,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10, left: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(
                                                              "Straight cut Suits",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF921C04),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontSize: 16),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10, left: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            SmoothStarRating(
                                                              rating: rating,
                                                              size: 20,
                                                              color: Colors
                                                                  .yellow[900],
                                                              filledIconData:
                                                                  Icons.star,
                                                              halfFilledIconData:
                                                                  Icons
                                                                      .star_half,
                                                              defaultIconData:
                                                                  Icons
                                                                      .star_border,
                                                              starCount: 5,
                                                              allowHalfRating:
                                                                  true,
                                                              spacing: 1.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10, top: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(
                                                              "\$1500",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      800],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 18),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 20),
                                                            ),
                                                            Text(
                                                              '\$2500',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      700],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 20),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 40,
                                                        color:
                                                            Color(0xFF5E1303),
                                                        child: Center(
                                                          child: Text(
                                                            "Add to cart",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 20),
                                      height: 300,
                                      child: Card(
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: numbers.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                child: Card(
                                                  elevation: 10,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                  child: Container(
                                                      child: Column(
                                                    children: <Widget>[
                                                      Image.network(
                                                        "http://surekhadesigns.in/json/Product/5951593584625_M.jpg",
                                                        height: 120,
                                                        width: 200,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10, left: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(
                                                              "Straight cut Suits",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF921C04),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontSize: 16),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10, left: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            SmoothStarRating(
                                                              rating: rating,
                                                              size: 20,
                                                              color: Colors
                                                                  .yellow[900],
                                                              filledIconData:
                                                                  Icons.star,
                                                              halfFilledIconData:
                                                                  Icons
                                                                      .star_half,
                                                              defaultIconData:
                                                                  Icons
                                                                      .star_border,
                                                              starCount: 5,
                                                              allowHalfRating:
                                                                  true,
                                                              spacing: 1.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10, top: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(
                                                              "\$1500",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      800],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 18),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 20),
                                                            ),
                                                            Text(
                                                              '\$2500',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      700],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 20),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 40,
                                                        color:
                                                            Color(0xFF5E1303),
                                                        child: Center(
                                                          child: Text(
                                                            "Add to cart",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
