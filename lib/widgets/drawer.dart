import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/language.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<Language> _languages = [];

  @override
  void initState() {
    super.initState();

    _getLanguages();
  }

  void _getLanguages() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/files/languages.json");
    List<dynamic> jsonLessons = json.decode(data);
    List<Language> languages =
        jsonLessons.map((jsonLesson) => Language.fromJson(jsonLesson)).toList();

    setState(() {
      _languages = languages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 36),
            child: Text(
              "Languages",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: _languages.length,
              itemBuilder: (BuildContext context, int index) {
                final Language language = _languages[index];

                return Material(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(language.icon),
                    ),
                    title: Text(language.name),
                    subtitle: Text(language.level),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 18,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                SizedBox(width: 16),
                Text("Add a new language")
              ],
            ),
          )
        ],
      ),
    );
  }
}
