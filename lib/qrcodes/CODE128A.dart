// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:style/Views/Generator.dart';
import 'package:style/main.dart';

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class co5 extends StatefulWidget {


  @override
  _co5State createState() => _co5State();
}

class _co5State extends State<co5> {
  TextEditingController txt;
  String str = "";
  GlobalKey globalKey = new GlobalKey();
  ScrollController _scrollController = ScrollController();

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

    (str.length == 16)? {overflow()} : null;
  }

  void overflow()
  {
    FocusScope.of(context).requestFocus(new FocusNode());
    Fluttertoast.showToast(
        msg: "Not more than 16",
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.teal
    );
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    height = height / 100;
    width = width / 100;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 45,
              ),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Home())),
            ),
            SizedBox(
              height: height * 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(25)),
                height: height * 7,
                width: MediaQuery.of(context).size.width - 30,
                child: TextField(
                  autofocus: false,
                  controller: txt,
                  onChanged: (value) {
                    setState(() {
                      str = value;
                    });
                  },
                  enableSuggestions: true,
                  cursorColor: Colors.blue,
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [LengthLimitingTextInputFormatter(16),FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9-./+% {}~|")(&]')),],
                  decoration: InputDecoration(
                      enabled: true,
                      suffixIcon: InkWell(
                          onTap: () {
                            //both sowPopupWindow and createPopupWindow
                            showPopupWindow(
                              context,
                              gravity: KumiPopupGravity.centerTop,
                              //curve: Curves.elasticOut,
                              bgColor: Colors.grey.withOpacity(0.5),
                              clickOutDismiss: true,
                              clickBackDismiss: true,
                              underAppBar: true,
                              offsetX: 500,
                              offsetY: 500,
                              duration: Duration(milliseconds: 200),
                              childFun: (pop) {
                                return Container(
                                  alignment: Alignment.center,
                                  key: GlobalKey(),
                                  padding: EdgeInsets.all(10),
                                  height: height * 10,
                                  width: width * 75,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Colors.teal,
                                        Colors.tealAccent
                                      ]),
                                      border: Border.all(
                                          width: 2, color: Colors.teal),
                                      borderRadius: BorderRadius.circular(65)),
                                  child: SingleChildScrollView(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 2 * width,
                                        ),
                                        Icon(Icons.info),
                                        SizedBox(
                                          width: width * 2,
                                        ),
                                        Text(
                                          "It Allows capital letters,numbers,symbles and small letters with length of  16 characters",
                                          style: GoogleFonts.crimsonPro(
                                              fontSize: width * 4,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.info,
                            color: Colors.teal,
                          )),
                      contentPadding: EdgeInsets.only(left: 25, top: 15),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "Type Here",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1)),
                ),
              ),
            ),
            SizedBox(
              height: 8 * height,
            ),
            Container(
              height: height * 35,
              alignment: Alignment.center,
              child: UnicornOutlineButton(
                  strokeWidth: 10,
                  radius: 15,
                  gradient: LinearGradient(colors: [
                    Colors.tealAccent,
                    Colors.teal,
                    Colors.cyan,
                    Colors.cyanAccent,
                  ]),
                  child: Container(
                    height: height * 50,
                    width: MediaQuery.of(context).size.width - 100,
                    alignment: Alignment.center,
                    child: RepaintBoundary(
                      key: globalKey,
                      child: Container(
                        color: Colors.white,
                        width: width * 55,
                        height: height * 28,
                        child: SfBarcodeGenerator(
                          value: str,
                          symbology: Code128A(),
                          barColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {}),
            ),
            SizedBox(
              height: height * 4,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          _capturePng();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 5,
                          width: width * 40,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 5,
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: width * 5,
                              ),
                              Text(
                                "Share",
                                style: GoogleFonts.firaMono(
                                    fontSize: width * 5,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _capturePng() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      //print(pngBytes);

      final tempDir = await getExternalStorageDirectory();
      final code39Img = await new File('${tempDir.path}/image1.png');
      await code39Img.writeAsBytes(pngBytes);
      RenderBox box = context.findRenderObject() as RenderBox;

      Share.shareFiles(
        ['${tempDir.path}/image1.png'],
        text: 'Your Code128A Image,This app is Made by Nithinraaj J',
        //sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
      );
    } on PlatformException catch (e) {
      print("Exception while taking screenshot:" + e.toString());
    }
  }
}

class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final _callback;
  final double _radius;

  UnicornOutlineButton({
    double strokeWidth,
    double radius,
    Gradient gradient,
    Widget child,
    onPressed,
  })  : this._painter = _GradientPainter(
      strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        this._child = child,
        this._callback = onPressed,
        this._radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            constraints: BoxConstraints(minWidth: 88, minHeight: 48),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {double strokeWidth,
        double radius,
        Gradient gradient})
      : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
    RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}





