import 'package:flutter/material.dart';
import 'package:movieapp/homepage/models/models.dart';
import 'package:movieapp/homepage/repository/home_repo.dart';

class HomeProvider extends HomeRepository with ChangeNotifier {
  List<Result> result = [];
  getMovie(BuildContext context) async {
    result = await getMovieAPI(context: context);

    notifyListeners();
  }
}
