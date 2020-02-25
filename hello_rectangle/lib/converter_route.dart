// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hello_rectangle/unit.dart';
import 'package:meta/meta.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
// TODO: Make ConverterRoute a StatefulWidget
class ConverterRoute extends StatelessWidget {
  /// Units for this [Category].
  final List<Unit> units;
  final ColorSwatch color;

  /// This [ConverterRoute] requires the color and units to not be null.
  // DONE Step 4.2: Pass in the [Category]'s color
  const ConverterRoute({
    @required this.units,
    @required this.color,
  })  : assert(units != null),
        assert(color != null);

  // TODO: Create State object for the ConverterRoute

  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    // TODO: Once the build() function is inside the State object,
    // you'll have to reference this using `widget.units`
    final unitWidgets = units.map((Unit unit) {
      // DONE Step 4.3: Set the color for this Container
      return Container(
        color: this.color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}
