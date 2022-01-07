import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share/share.dart';

class FullImage extends StatefulWidget {

  String imagePath;
  FullImage(this.imagePath);
  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  Color _themeColor=Color(0xff30384c);
  @override
  Widget build(BuildContext context) {
    void _onLoading(bool t, String str) {
     
      if (t) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return SimpleDialog(
                children: <Widget>[
                  Center(
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: CircularProgressIndicator()),
                  ),
                ],
              );
            });
      } else {
        Navigator.pop(context);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SimpleDialog(
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Great! Saved Successfully',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                            // SizedBox(height: 20,),
                            Text(str,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,

                                )),
                            // SizedBox(height: 15,),
                            // Text("Storage > whatsapp_status_saver",
                            //     style: TextStyle(
                            //         fontSize: 16.0, color: _themeColor,fontWeight: FontWeight.bold)),
                            SizedBox(height: 20,),
                            MaterialButton(
                              child: Text("Close"),
                               color: Colors.teal,
                             
                              textColor: Colors.white,
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      }
    }
    return Hero(
      tag: widget.imagePath,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: _themeColor,
          actions: [
            IconButton(
              onPressed: () async {
                 _onLoading(
              false,
              'Video Saved in Gallery',
            );
                // FacebookInterstitialAd.loadInterstitialAd(
                //   placementId: "YOUR_PLACEMENT_ID",
                //   listener: (result, value) {
                //     if (result == InterstitialAdResult.LOADED)
                //       FacebookInterstitialAd.showInterstitialAd(delay: 5000);
                //   },
                // );

                final myUri = Uri.parse(widget.imagePath);
                final originalImageFile = File.fromUri(myUri);
                Uint8List bytes;
                await originalImageFile.readAsBytes().then((value) {
                  bytes = Uint8List.fromList(value);
                  print('reading of bytes is completed');
                }).catchError((onError) {
                  print('Exception Error while reading audio from path:' +
                      onError.toString());
                });
                final result =
                await ImageGallerySaver.saveImage(Uint8List.fromList(bytes));
            

              },
              icon: Icon(Icons.download_sharp,size:30),
            ),
            IconButton(
              onPressed: (
                
              ){

                print("Sharing");
                Share.shareFiles([widget.imagePath]);

              },
              icon: Icon(Icons.share_outlined,size: 25,),
            ),
            SizedBox(width: 10,)
          ],
        ),
        body: Center(
          child: Image.file(
            File(widget.imagePath),
          ),
        ),

      ),
    );
  }

  _getHttp() async {
    var response = await Dio().get(
        widget.imagePath,
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");

  }


}
