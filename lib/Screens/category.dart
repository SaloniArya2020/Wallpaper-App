import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_hub/Models/wallpaper_model.dart';
import 'package:wallpaper_hub/Widgets/appBar.dart';
import 'package:wallpaper_hub/Widgets/wallpaper_list.dart';
import 'package:http/http.dart' as http;
import '../data/data.dart';


class CategoryPage extends StatefulWidget {
  final String categoryName;
  const CategoryPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List<WallpaperModel> wallpapers =[];

  getCategoryImg(String query) async{

    var res = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=10"),
        headers: {'Authorization': apiKey}
    );

   Map<String, dynamic> jsonData = jsonDecode(res.body);

   jsonData["photos"].forEach((e){
     WallpaperModel wallpaperModel = WallpaperModel.fromMap(e);
     wallpapers.add(wallpaperModel);
   });

   setState(() {});

  }

  @override
  void initState() {
    getCategoryImg(widget.categoryName);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black54),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            wallpaperList(wallpapers, context),
          ],
        ),
      ),

    );
  }
}
