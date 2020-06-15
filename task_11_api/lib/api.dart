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
    final jsonResponse = await _getResponseAsJson(_getUnitsUri(category));
    if (jsonResponse == null || jsonResponse["units"] == null) return null;
    return jsonResponse['units'];
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
    final uriRequest = _getConverterUri().replace(
        queryParameters: {"amount": amount, "from": fromUnit, "to": toUnit});
    final jsonResponse = await _getResponseAsJson(uriRequest);
    if (jsonResponse == null || jsonResponse["status"] == null) {
      return null;
    } else if (jsonResponse["status"] == "error") {
      print(jsonResponse["message"]);
      return null;
    }
    final conversionResult = jsonResponse["conversion"].toDouble();
    return conversionResult;
  }

  Future<Map<String, dynamic>> _getResponseAsJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      // NOTE: HttpStatus.OK is deprecated
      if (httpResponse.statusCode != HttpStatus.ok) {
        return null;
      }
      // The response is sent as a Stream of bytes that we need to convert to a
      // `String`.
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print("$e");
      return null;
    }
  }
}
