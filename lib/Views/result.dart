// @dart=2.9
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/src/types/barcode.dart';
import 'package:style/Views/scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class Result extends StatefulWidget {
  Barcode result;
  Result(this.result);
  @override
  _ResultState createState() => _ResultState(result);
}

class _ResultState extends State<Result> {
  Barcode result;
  _ResultState(this.result);
  bool check = false;
  String ss;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ss = result.code;
    check = Uri.parse(result.code).isAbsolute;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    height = height / 100;
    width = width / 100;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF3383CD),
                        Color(0xFF11249F),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 15),
                        child: Container(
                          height: 5 * height,
                          width: 10 * width,
                          child: IconButton(
                            icon: Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => scanner()));
                            },
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: height * 25,
                          width: width * 50,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(45),
                              image: new DecorationImage(
                                  image: AssetImage("assets/qrvector.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4 * height,
              ),
              Container(
                  height: 35 * height,
                  width: MediaQuery.of(context).size.width - 35,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 25 * height,
                            width: MediaQuery.of(context).size.width - 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: new DecorationImage(
                                    image: AssetImage("assets/bobo.gif"),
                                    fit: BoxFit.cover)),
                          )),
                      Expanded(
                          flex: 3,
                          child: check
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: height * 10,
                                    ),
                                    Text(
                                      "URL",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 2,
                                          fontFamily: "roboto",
                                          decoration: TextDecoration.underline),
                                    ),
                                    SizedBox(
                                      height: height * 2,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 9),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: RichText(
                                              text: new TextSpan(children: [
                                            new TextSpan(
                                                text: ss,
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    decoration: TextDecoration
                                                        .underline),
                                                recognizer:
                                                    new TapGestureRecognizer()
                                                      ..onTap =
                                                          () => _launchurl(ss))
                                          ])),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3 * height,
                                    ),
                                    GestureDetector(
                                      onTap: () => _launchurl(ss),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 4 * height,
                                        width: 45 * width,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Text(
                                          "Open in Browser",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: 'roboto'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: height * 3,
                                          width: width * 25,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: InkWell(
                                            onTap: () {
                                              FlutterClipboard.copy(ss);
                                              _scaffoldKey.currentState
                                                  .showSnackBar(SnackBar(
                                                      content:
                                                          Text("Text Copied")));
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "copy",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                SizedBox(
                                                  width: width * 2,
                                                ),
                                                Icon(
                                                  Icons.copy,
                                                  size: 14,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 2,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: height * 3,
                                          width: width * 25,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Share.share(ss);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "share",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: width * 2,
                                                ),
                                                Icon(
                                                  Icons.share,
                                                  size: 14,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: height * 10,
                                    ),
                                    Text(
                                      "URL Message",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 2,
                                          fontFamily: "roboto",
                                          decoration: TextDecoration.underline),
                                    ),
                                    SizedBox(
                                      height: height * 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 9.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          ss,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2 * height,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: height * 4,
                                      width: width * 30,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: InkWell(
                                        onTap: () {
                                          FlutterClipboard.copy(ss);
                                          _scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text("Text Copied")));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "copy",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            SizedBox(
                                              width: width * 2,
                                            ),
                                            Icon(
                                              Icons.copy,
                                              size: 14,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 1,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: height * 4,
                                      width: width * 30,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Share.share(ss);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "share",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            SizedBox(
                                              width: width * 2,
                                            ),
                                            Icon(
                                              Icons.share,
                                              size: 14,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  static Future _launchurl(String url) async {
    if (await canLaunch(url)) {
      print("launch");
      await launch(url, forceWebView: true, forceSafariVC: true);
    } else {
      throw "could not launch";
    }
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
