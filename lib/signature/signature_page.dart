import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

void showSignatureDialog(BuildContext context) {
  final GlobalKey<SfSignaturePadState> keySignaturePad = GlobalKey();

  void _handleclearbutton() {
    keySignaturePad.currentState?.clear();
  }

  void _saveImage() {
    keySignaturePad.currentState!.toImage();
    log("message");
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
                    _saveImage();
                  },
                  child: const Text("Save"),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: _handleclearbutton,
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
