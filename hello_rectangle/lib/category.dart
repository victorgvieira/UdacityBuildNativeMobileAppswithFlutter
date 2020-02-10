// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.

const _borderRadius = 50.0;
const _categoryHeight = 100.0;
const _iconSize = 60.0;
const _textSize = 24.0;

class Category extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;
  final MaterialColor categoryColor;

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // DONE Step 2.2: You'll need the name, color, and iconLocation from main.dart
  // NOTE: put variables in {} means that they are optional and named
  const Category(
      {@required this.categoryName,
      @required this.categoryIcon,
      @required this.categoryColor})
      : assert(categoryColor != null),
        assert(categoryName != null),
        assert(categoryIcon != null);

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    // DONE Step 2.3: Build the custom widget here, referring to the Specs.
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _categoryHeight,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(_borderRadius),
            onTap: () {
              print('I was tapped!');
            },
            splashColor: categoryColor,
            highlightColor: categoryColor,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    categoryIcon,
                    size: _iconSize,
                  ),
                ),
                Center(
                  child: Text(
                    categoryName,
                    style: TextStyle(fontSize: _textSize),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
