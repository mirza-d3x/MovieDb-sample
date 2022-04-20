import 'package:apisample/Api/MoviesApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:apisample/Model/searchModel.dart';

class SearchProvider with ChangeNotifier {
  SearchModel searchModel = SearchModel();
  MoviesApi moviesApi = MoviesApi();

  bool loading = false;

  getSearchResultsProv(context,String value) async {
    loading = true;
    searchModel = await moviesApi.getSearchResulsApi(value);
    print('Proivder:$value');
    loading = false;
    notifyListeners();
  }
}
