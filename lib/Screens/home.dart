import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_hub/Models/category_model.dart';
import 'package:wallpaper_hub/Models/wallpaper_model.dart';
import 'package:wallpaper_hub/Screens/category.dart';
import 'package:wallpaper_hub/Screens/search.dart';
import 'package:wallpaper_hub/Widgets/appBar.dart';
import 'package:wallpaper_hub/Widgets/wallpaper_list.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  TextEditingController _searchController = TextEditingController();

  getImages() async {
    var res = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=10"),
        headers: {'Authorization': apiKey});

    Map<String, dynamic> jsonData = jsonDecode(res.body);

    jsonData['photos'].forEach((data) {
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(data);
      wallpapers.add(wallpaperModel);
      print(wallpapers);
    });

    setState(() {});
  }

  @override
  void initState() {
    getImages();
    categories = getCategory();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: appBar(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //Search Input
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    // Search Input
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'search wallpaper'),
                      ),
                    ),

                    GestureDetector(
                        onTap: () {
                          if(_searchController.text != ''){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search(
                                      searchQuery:
                                      _searchController.text.trim(),
                                    )));
                          }
                        },
                        child: Icon(Icons.search))
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Made By',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Text(
                      ' Saloni',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    )
                  ],
                ),
              ),

              //Category tiles
              Container(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          imgUrl: categories[index].imgUrl,
                          categoryName: categories[index].categoryName,
                        );
                      })),

              SizedBox(
                height: 20,
              ),

              //WallpaperList
              wallpaperList(wallpapers, context)
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String imgUrl;
  String categoryName;
  CategoryTile({Key? key, required this.imgUrl, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(categoryName: categoryName)));
        // print(categoryName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
                height: 50,
                width: 100,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              width: 100,
              height: 50,
              child: Text(
                categoryName,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
