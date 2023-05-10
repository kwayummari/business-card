import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:business_card/src/utils/app_const.dart';
import 'package:business_card/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class MyImagePage extends StatefulWidget {
  const MyImagePage({Key? key}) : super(key: key);

  @override
  _MyImagePageState createState() => _MyImagePageState();
}

class _MyImagePageState extends State<MyImagePage> {
  GlobalKey globalKey = GlobalKey();

  Future<Uint8List?> _captureImage() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      var byteData = await image.toByteData(format: ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }

  Future<void> _shareImage() async {
    Uint8List? imageBytes = await _captureImage();
    if (imageBytes != null) {
      String imageName = 'my_business_card.png';
      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/$imageName').create();
      await file.writeAsBytes(imageBytes);
      await Share.shareFiles([file.path], text: 'Check out my business card!');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error sharing image')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      backgroundImage: false,
      backgroundAuth: false,
      isvisible: false,
      appBar: AppBar(
        backgroundColor: AppConst.primary,
        title: Text('My Business Card'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _shareImage,
          ),
        ],
      ),
      child: Center(
        child: RepaintBoundary(
          key: globalKey,
          child: Container(
            width: 300,
            height: 200,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'CEO, KWAYU MMARI',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
