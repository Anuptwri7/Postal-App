import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

ui.Image? imageSignature;
ByteData? byteData;

void showSignatureDialog(BuildContext context) {
  final GlobalKey<SfSignaturePadState> keySignaturePad = GlobalKey();

  void _clearbutton() {
    keySignaturePad.currentState?.clear();
  }

  void _saveSignatureImage() async {
    RenderSignaturePad boundary = keySignaturePad.currentContext
        ?.findRenderObject() as RenderSignaturePad;
    imageSignature = await boundary.toImage();
    // log(base64Encode(imageSignature!.readAsBytesSync()));
    byteData =
        await (imageSignature!.toByteData(format: ui.ImageByteFormat.png));
     log(byteData!.buffer.asUint8List().toString());
    Fluttertoast.showToast(msg: "Succesfully added signauture");
    Navigator.pop(context);
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Please Draw a Signature"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 150,
                width: 300,
                child: SfSignaturePad(
                  key: keySignaturePad,
                  backgroundColor: Colors.black,
                  strokeColor: Colors.white,
                )),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    _saveSignatureImage();
                  },
                  child: const Text("Save"),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: _clearbutton,
                  child: const Text("Clear"),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
