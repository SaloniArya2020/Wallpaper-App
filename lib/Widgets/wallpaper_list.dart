import 'package:flutter/material.dart';
import 'package:wallpaper_hub/Screens/img_view.dart';

import '../Models/wallpaper_model.dart';

Widget wallpaperList(List<WallpaperModel> wallpapers, context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 0.7,
      crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 6,
      children: wallpapers.map((wallpaper){
        return Hero(
          tag: wallpaper.src.imgPortrait,
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImgView(imgUrl: wallpaper.src.imgPortrait) ));
            },
            child: GridTile(child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: Image.network(wallpaper.src.imgPortrait, fit: BoxFit.cover,))),
          ),
        );
      }).toList(),
    ),
  );
}