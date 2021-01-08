import 'package:ewalet_flutter_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../custom_view.dart';

const _flashOn = "FLASH_ON";
const _backCamera = "BACK_CAMERA";

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() {
    return _ScannerScreenState();
  }
}

class _ScannerScreenState extends State<ScannerScreen> {
  var flashState = _flashOn;
  var cameraState = _backCamera;
  var torchIcon =  Icon(Icons.flash_off, color: Colors.white, size: 32,);
  var torchText = "Press to activate";
  var torchState = false;

  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");

  void _onViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        showToast(context: context, message: scanData);
      });
    });
  }

  void _setTorchState(){
    setState(() {
      torchState = !torchState;
      controller.toggleFlash();
      if(torchState) {
        torchText = "Press to deactivate";
        torchIcon =  Icon(Icons.flash_on, color: HexColor("#E64A19"), size: 32,);
      } else {
        torchText = "Press to activate";
        torchIcon =  Icon(Icons.flash_off, color: Colors.white, size: 32,);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            QRView(key: qrKey,
              onQRViewCreated: _onViewCreated,
              overlay:  QrScannerOverlayShape(
                  borderColor: HexColor("#E64A19"),
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 280
              ),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: ((MediaQuery.of(context).size.height / 2) + 48),
                ),
                IconButton(
                  icon: torchIcon,
                  onPressed: (){
                    _setTorchState();
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(torchText, style: TextStyle(color: Colors.white, fontSize: 16.0),)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
