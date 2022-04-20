import 'package:apisample/Api/MoviesApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:apisample/Model/TvShowDetailsModel.dart';

class TvShowDetailsProvider with ChangeNotifier {
  TvShowDetailsModel tvShowsDetailsModel = TvShowDetailsModel();
  MoviesApi moviesApi = MoviesApi();

  bool loading = false;

  getTvShDePro(context,String id) async {
    loading = true;
    tvShowsDetailsModel = await moviesApi.getMoviesDetailsApi(id);
    loading = false;
    notifyListeners();
  }
}
