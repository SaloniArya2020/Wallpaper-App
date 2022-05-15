import 'package:flutter/material.dart';

Widget appBar(BuildContext context){

  return RichText(text: TextSpan(
  children: [
    TextSpan(text:'Wallpaper', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
    TextSpan(text:'Hub', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue)),
  ]
  ),);

}