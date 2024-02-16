import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/data/const/app_const.dart';
import 'package:movie_app/data/models/movie_list_model.dart';

class MovieProvider extends ChangeNotifier {
  MovieProvider({required this.dio});
  final Dio dio;
  MovieListModel? data;

  Future<void> getMovie(String name) async {
    try {
      final response = await dio.get('', queryParameters: {
        'apikey': AppConsts.apiKey,
        's': name,
      });
      data = MovieListModel.fromJson(response.data);
    } catch (e) {
      print(
        e.toString(),
      );
      notifyListeners();
    }
  }
}
