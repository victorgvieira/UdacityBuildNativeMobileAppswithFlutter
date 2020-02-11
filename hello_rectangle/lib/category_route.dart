// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// NOTE Step 3: this code was copied from https://raw.githubusercontent.com/flutter/udacity-course/master/course/03_category_route/task_03_category_route/lib/category_route.dart
// DONE 3.1: Check if we need to import anything
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hello_rectangle/category.dart';

// DONE 3.2: Define any constants
final _appBarTitle = "Unit Converter";
final _appBarFontSize = 30.0;
final _appBarElevation = 0.0;

final _appColor = Colors.green[100];

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  List<Category> _createCategoryList() {
    List<Category> result = List.generate(
        8,
        (index) => Category(
              categoryName: _categoryNames[index],
              categoryColor: _baseColors[index],
              categoryIcon: Icons.cake,
            ));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // DONE Step 3,3: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    var categoryList = _createCategoryList();

    // DONE Step 3.4: Create a list view of the Categories
    final listView = ListView.builder(
      itemBuilder: (BuildContext context, int index) => categoryList[index],
      itemCount: categoryList.length,
    );

    final bodyList = Container(
      padding: EdgeInsets.all(8.0),
      color: _appColor,
      child: listView,
    );

    // DONE Step 3.5: Create an App Bar
    final appBar = AppBar(
      backgroundColor: _appColor,
      elevation: _appBarElevation,
      title: Text(
        _appBarTitle,
        style: TextStyle(
          fontSize: _appBarFontSize,
          color: Colors.black
        ),
      ),
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: bodyList,
    );
  }
}
