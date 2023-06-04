import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:business_card/src/utils/app_const.dart';
import 'package:business_card/src/widgets/app_base_screen.dart';
import 'package:business_card/src/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class MyImagePage extends StatefulWidget {
  var name;
  var job;
  var company;
  var phone;
  var email;
  var website;
  var work;
  MyImagePage(
      {Key? key,
      required this.name,
      required this.job,
      required this.company,
      required this.phone,
      required this.email,
      required this.work,
      required this.website})
      : super(key: key);

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
      String imageName = '${widget.name} Electronic business card.png';
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
        child: Column(
          children: [
            RepaintBoundary(
              key: globalKey,
              child: Container(
                decoration: BoxDecoration(
                  color: AppConst.black,
                  border: Border.all(
                    color: AppConst.white,
                    width: 2.0,
                  ),
                ),
                width: 300,
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 130,
                        width: 120,
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        decoration: BoxDecoration(
                          color: AppConst.primary,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(26),
                              bottomLeft: Radius.circular(126),
                              bottomRight: Radius.circular(0)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: QrImage(
                        data: 'MECARD:N:${widget.website};TEL:${widget.phone};',
                        version: QrVersions.auto,
                        size: 80.0,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: AppText(
                        txt: widget.name,
                        size: 15,
                        color: AppConst.white,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: AppText(
                        txt: widget.job,
                        size: 12,
                        color: AppConst.white,
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 20,
                      child: Container(
                        width: 250,
                        height: 40,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: AppConst.primary,
                              child: Icon(
                                Icons.phone,
                                size: 10,
                                color: AppConst.white,
                              ),
                            ),
                            AppText(
                              txt: widget.phone,
                              size: 12,
                              color: AppConst.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 20,
                      child: Container(
                        width: 250,
                        height: 40,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: AppConst.primary,
                              child: Icon(
                                Icons.mail,
                                size: 10,
                                color: AppConst.white,
                              ),
                            ),
                            AppText(
                              txt: widget.email,
                              size: 12,
                              color: AppConst.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 20,
                      child: Container(
                        width: 250,
                        height: 40,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: AppConst.primary,
                              child: Icon(
                                Icons.public,
                                size: 10,
                                color: AppConst.white,
                              ),
                            ),
                            AppText(
                              txt: widget.website,
                              size: 12,
                              color: AppConst.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: 20,
                      child: Container(
                        width: 250,
                        height: 40,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: AppConst.primary,
                              child: Icon(
                                Icons.cases,
                                size: 10,
                                color: AppConst.white,
                              ),
                            ),
                            AppText(
                              txt: widget.work,
                              size: 12,
                              color: AppConst.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            QrImage(
              backgroundColor: AppConst.white,
              data: 'MECARD:N:${widget.website};TEL:${widget.phone};',
              version: QrVersions.auto,
              size: 80.0,
            ),
          ],
        ),
      ),
    );
  }
}
