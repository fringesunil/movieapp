import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/homepage/models/models.dart';

class HomeRepository {
  var receiptBody = {
    "category": "movies",
    "language": "kannada",
    "genre": "all",
    "sort": "voting"
  };
  Future getMovieAPI({required BuildContext context}) async {
    const String url = 'https://hoblist.com/api/movieList';
    final response = await http.post(Uri.parse(url), body: receiptBody);
    final data = jsonDecode(response.body);
    print("RESPONSE---->${data["result"][0]["poster"]}");
    return movieFromJson(response.body).result;
  }
}
