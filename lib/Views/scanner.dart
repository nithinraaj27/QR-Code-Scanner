// @dart=2.9
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:style/Views/result.dart';

class scanner extends StatefulWidget {
  @override
  _scannerState createState() => _scannerState();
}

class _scannerState extends State<scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;
  String ck;
  //bool _validURL = Uri.parse(_adVertData.webLink).isAbsolute;
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderRadius: 10,
            borderColor: Colors.red,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: 300,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        ck = result.code;
        if(result != null)
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Result(result)));
          }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

