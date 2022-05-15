import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_hub/Models/wallpaper_model.dart';
import 'package:wallpaper_hub/Widgets/appBar.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_hub/Widgets/wallpaper_list.dart';

import '../data/data.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  const Search({Key? key, required this.searchQuery}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpapers = [];
  TextEditingController _searchController = TextEditingController();

  getSearchData(String search) async {
    var searchRes = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$search&per_page=10"),
        headers: {'Authorization': apiKey});

    Map<String, dynamic> jsonData = jsonDecode(searchRes.body);

    jsonData['photos'].forEach((data) {
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(data);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
      getSearchData(widget.searchQuery);
      _searchController.text = widget.searchQuery;

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
                         hintText: widget.searchQuery,
                      ),
                    ),
                  ),

                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                  searchQuery:
                                  _searchController.text.trim(),
                                )));
                      },
                      child: Icon(Icons.search))
                ],
              ),
            ),

            wallpaperList(wallpapers, context)],
        ),
      ),
    );
  }
}
