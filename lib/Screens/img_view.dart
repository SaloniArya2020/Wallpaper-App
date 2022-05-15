import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImgView extends StatefulWidget {

  final String imgUrl;
  const ImgView({Key? key, required this.imgUrl}) : super(key: key);

  @override
  _ImgViewState createState() => _ImgViewState();
}

class _ImgViewState extends State<ImgView> {

  _save() async {
    var response = await Dio().get(
        widget.imgUrl,
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),);
    print(result);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl,
            child: Image.network(
              widget.imgUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 90,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                   _save();
                   
                   final snackBar = SnackBar(content: Text('Image Downloaded...'));
                   
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                   
                  },

                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black38.withOpacity(0.5),
                      border: Border.all(color: Colors.white,width: 0.8),
                      borderRadius: BorderRadius.circular(18)
                    ),
                    child: Text(
                      'Download Wallpaper',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 15),))
              ],
            ),
          )
        ],
      ),
    );
  }
}
