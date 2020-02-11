// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
import 'package:hello_rectangle/category.dart';
import 'package:hello_rectangle/category_route.dart';

// TODO: Import the CategoryRoute widget

// You can use a relative import, i.e. `import 'category.dart';` or
// a package import, as shown below.
// More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html

// NOTE Starter code copied from: https://github.com/flutter/udacity-course/tree/master/course/02_category_widget/task_02_category_widget

// DONE Step 2.0: Pass this information into your custom [Category] widget
const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

/// The function that is called when main.dart is run.
void main() {
  runApp(UnitConverterApp());
}

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Unit Converter',
        // DONE Step 3.0: Instead of pointing to exactly 1 Category widget,
        // our home should now point to an instance of the CategoryRoute widget.
        home: CategoryRoute()
//      Scaffold(
//        body: Center(
//          // DONE Step 2.1: Determine what properties you'll need to pass into the widget
//          child: Category(
//            categoryColor: _categoryColor,
//            categoryIcon: _categoryIcon,
//            categoryName: _categoryName,
//          ),
//        ),
//      ),
        );
  }
}
