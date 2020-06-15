// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// DONE Step 1: Import relevant packages
import 'dart:convert';
import 'dart:io';

import 'category.dart';

/// If we had more, we could keep a list of [Categories] here.
const apiCategory = {
  'name': 'Currency',
  'route': 'currency',
};

/// The REST API retrieves unit conversions for [Categories] that change.
///
/// For example, the currency exchange rate, stock prices, the height of the
/// tides change often.
/// We have set up an API that retrieves a list of currencies and their current
/// exchange rate (mock data).
///   GET /currency: get a list of currencies
///   GET /currency/convert: get conversion from one currency amount to another
class Api {
  // DONE Step 1.1: Add any relevant variables and helper functions
  final _httpClient = HttpClient();
  final _baseUrl = "flutter.udacity.com";

  Uri _getUnitsUri(String category) {
    return Uri.https(_baseUrl, "/$category");
  }

  Uri _getConverterUri() {
    return Uri.https(_baseUrl, "/currency/convert");
  }

// DONE Step 2: Create getUnits()
  /// Gets all the units and conversion rates for a given category.
  ///
  /// The `category` parameter is the name of the [Category] from which to
  /// retrieve units. We pass this into the query parameter in the API call.
  ///
  /// Returns a list. Returns null on error.
  // NOTE json.decode return as a MAP
  Future<List> getUnits(String category) async {
    final httpRequest = await _httpClient.getUrl(_getUnitsUri(category));
    final httpResponse = await httpRequest.close();
    // NOTE: HttpStatus.OK is deprecated
    if (httpResponse.statusCode != HttpStatus.ok) {
      return null;
    }
    final responseBody = await httpResponse.transform(utf8.decoder).join();
    final jsonResponse = json.decode(responseBody);
    final value = jsonResponse['units'];
    return value;
  }

// DONE Step 3: Create convert()
  /// Given two units, converts from one to another.
  ///
  /// Returns a double, which is the converted amount. Returns null on error.
  Future<double> convert(
    String category,
    String amount,
    String fromUnit,
    String toUnit,
  ) async {
    final httpRequest = await _httpClient.getUrl(_getConverterUri().replace(
        queryParameters: {"amount": amount, "from": fromUnit, "to": toUnit}));
    final httpResponse = await httpRequest.close();
    // NOTE: HttpStatus.OK is deprecated
    if (httpResponse.statusCode != HttpStatus.ok) {
      return null;
    }
    final responseBody = await httpResponse.transform(utf8.decoder).join();
    final jsonResponse = json.decode(responseBody);
    final value = jsonResponse['conversion'].toDouble();
    return value;
  }
}
