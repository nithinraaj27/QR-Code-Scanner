// @dart=2.9
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:style/Views/Generator.dart';
import 'package:style/Views/scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 10),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
    });
    super.initState();
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height * 40,
                width: width * 75,
                decoration: BoxDecoration(
                  image: new DecorationImage(image: AssetImage("assets/san.gif",),fit: BoxFit.fill)
                ),
              ),
              SizedBox(height: height * 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("QR",style: GoogleFonts.gloriaHallelujah(fontSize: height * 3,fontWeight: FontWeight.bold),),
                  Text(" DOCTOR",style: GoogleFonts.gloriaHallelujah(fontSize: height * 3,fontWeight: FontWeight.w800,color: Colors.teal),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  int currentIndex = 1;

  List<Widget> _widgets =[
    scanner(),
    Generator(),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    height = height / 100;
    width = width / 100;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() => currentIndex = i),
          unselectedItemColor: Colors.blue,
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.qr_code_scanner),
              title: Text("Scanner"),
              selectedColor: Colors.pinkAccent,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.qr_code_outlined),
              title: Text("Generator"),
              selectedColor: Colors.pinkAccent,
            ),
          ],
    ),
        body: _widgets[currentIndex],
    )
    );
  }
}

