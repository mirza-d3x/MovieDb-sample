import 'dart:convert';
import 'package:apisample/Model/TrendingModel.dart';
import 'package:apisample/Model/MovieModel.dart';
import 'package:apisample/Api/ApiClient.dart';
import 'package:apisample/Model/TvShowsModel.dart';
import 'package:http/http.dart';
import 'package:apisample/Model/TvShowDetailsModel.dart';
import 'package:apisample/Model/searchModel.dart';

class MoviesApi {
  ApiClient apiClient = ApiClient();
  String trendingpath = "trending/movie/day";
  String moviePath = "movie/";
  String tvShowsPath = "tv/top_rated";
  String tvShowPath = "tv/";
  String searchPatch = "search/movie";

  Future<MovieDetailsModel> getMoviesDetails(String id) async {
    Response response =
        await apiClient.invokeApi(moviePath + id, 'GET', null, false, 'null');
    return MovieDetailsModel.fromJson(jsonDecode(response.body));
  }

  Future<TrendingModel> getTrendingMovie() async {
    Response response =
        await apiClient.invokeApi(trendingpath, 'GET', null, false, 'null');
    return TrendingModel.fromJson(jsonDecode(response.body));
  }

  Future<TvshowsModel> getTvShows() async {
    Response response =
        await apiClient.invokeApi(tvShowsPath, 'GET', null, false, 'null');
    return TvshowsModel.fromJson(jsonDecode(response.body));
  }

  Future<TvShowDetailsModel> getMoviesDetailsApi(String id) async {
    Response response =
        await apiClient.invokeApi(tvShowPath + id, 'GET', null, false, 'null');
    return TvShowDetailsModel.fromJson(jsonDecode(response.body));
  }

  Future<SearchModel> getSearchResulsApi(String value) async {
    Response response =
        await apiClient.invokeApi(searchPatch, 'GET', null, true, value);
    print('MoviesApi:$value');
    return SearchModel.fromJson(jsonDecode(response.body));
  }
}
