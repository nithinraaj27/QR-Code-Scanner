// @dart=2.9
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:style/qrcodes/CODE128A.dart';
import 'package:style/qrcodes/CODE128B.dart';
import 'package:style/qrcodes/code128.dart';
import 'package:style/qrcodes/code128c.dart';
import 'package:style/qrcodes/code39.dart';
import 'package:style/qrcodes/code93.dart';
import 'package:style/qrcodes/datamatrix.dart';
import 'package:style/qrcodes/ean13.dart';
import 'package:style/qrcodes/ean8.dart';
import 'package:style/qrcodes/qrcode.dart';
import 'package:style/qrcodes/upca.dart';
import 'package:style/qrcodes/upce.dart';

class Generator extends StatefulWidget {
  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    height = height / 100;
    width = width / 100;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
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
                    child: Center(
                      child: Text("CODE GENERATOR",
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: width * 5,
                        letterSpacing: 3,
                        wordSpacing: 2,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      image: new DecorationImage(
                          image: AssetImage("assets/robot.gif"))),
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "CHOOSE TO CREATE",
                          style: GoogleFonts.merienda(
                              fontSize: width * 5,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue[400]),
                        ),
                      ),
                    )),
              ],
            ),
          )),
          Expanded(
              flex:3,
              child: Column(
                children: [
                  Expanded(flex: 3,child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co1())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "QR Code",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co2())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "Code 39",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co3()
                            )),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "Code 93",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Expanded(flex: 3,child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co4())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "Code 128",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co5())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "Code 128A",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co6())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "Code 128B",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Expanded(flex: 3,child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co7())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "Code 128C",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co8())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "UPC A",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co9())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "UPC E",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Expanded(flex: 3,child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co10())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "EAN 8",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => co11())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "EAN 13",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => datamatrix())),
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue,
                                        offset: Offset(0,0),
                                        blurRadius: 10,
                                        spreadRadius: 3)
                                  ]),
                              child: Text(
                                "Data Matrix",
                                style: GoogleFonts.merienda(
                                    color: Colors.white,
                                    fontSize: 3 * width,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Expanded(child: Container(color: Colors.white,)),
                  Expanded(child: Container(color: Colors.white,)),
                  Expanded(child: Container(color: Colors.white,)),
                ],
              ))
        ],
      ),
    );
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
