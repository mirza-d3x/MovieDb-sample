/// page : 1
/// results : [{"adult":false,"backdrop_path":"/guwkQkGwaotM5IHeMAiVkiSlZT1.jpg","genre_ids":[53,18],"id":757276,"media_type":"movie","original_language":"ml","original_title":"നാരദൻ","overview":"Chandraprakash, a well-known TV news anchor, comes under undue pressure from his higher-ups to bring competitive exclusives, which urges him to leave the job. When a rival media group offers him a new job, he rebrands himself into a loud, tyrannical journalist, catering to those looking for news theatrics.","popularity":3.872,"poster_path":"/pZ4fVh4NG18D4mbf0lJGoAzfT0E.jpg","release_date":"2022-03-03","title":"Naradan","video":false,"vote_average":8.3,"vote_count":2}]
/// total_pages : 1
/// total_results : 1

class SearchModel {
  SearchModel({
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) {
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
  }

  SearchModel.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;

  SearchModel copyWith({
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      SearchModel(
        page: page ?? _page,
        results: results ?? _results,
        totalPages: totalPages ?? _totalPages,
        totalResults: totalResults ?? _totalResults,
      );

  int? get page => _page;

  List<Results>? get results => _results;

  int? get totalPages => _totalPages;

  int? get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }
}

/// adult : false
/// backdrop_path : "/guwkQkGwaotM5IHeMAiVkiSlZT1.jpg"
/// genre_ids : [53,18]
/// id : 757276
/// media_type : "movie"
/// original_language : "ml"
/// original_title : "നാരദൻ"
/// overview : "Chandraprakash, a well-known TV news anchor, comes under undue pressure from his higher-ups to bring competitive exclusives, which urges him to leave the job. When a rival media group offers him a new job, he rebrands himself into a loud, tyrannical journalist, catering to those looking for news theatrics."
/// popularity : 3.872
/// poster_path : "/pZ4fVh4NG18D4mbf0lJGoAzfT0E.jpg"
/// release_date : "2022-03-03"
/// title : "Naradan"
/// video : false
/// vote_average : 8.3
/// vote_count : 2

class Results {
  Results({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    dynamic popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    dynamic voteAverage,
    int? voteCount,
  }) {
    _adult = adult;
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _mediaType = mediaType;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  Results.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    _id = json['id'];
    _mediaType = json['media_type'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  bool? _adult;
  String? _backdropPath;
  List<int>? _genreIds;
  int? _id;
  String? _mediaType;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  dynamic _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  dynamic _voteAverage;
  int? _voteCount;

  Results copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    dynamic popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    dynamic voteAverage,
    int? voteCount,
  }) =>
      Results(
        adult: adult ?? _adult,
        backdropPath: backdropPath ?? _backdropPath,
        genreIds: genreIds ?? _genreIds,
        id: id ?? _id,
        mediaType: mediaType ?? _mediaType,
        originalLanguage: originalLanguage ?? _originalLanguage,
        originalTitle: originalTitle ?? _originalTitle,
        overview: overview ?? _overview,
        popularity: popularity ?? _popularity,
        posterPath: posterPath ?? _posterPath,
        releaseDate: releaseDate ?? _releaseDate,
        title: title ?? _title,
        video: video ?? _video,
        voteAverage: voteAverage ?? _voteAverage,
        voteCount: voteCount ?? _voteCount,
      );

  bool? get adult => _adult;

  String? get backdropPath => _backdropPath;

  List<int>? get genreIds => _genreIds;

  int? get id => _id;

  String? get mediaType => _mediaType;

  String? get originalLanguage => _originalLanguage;

  String? get originalTitle => _originalTitle;

  String? get overview => _overview;

  dynamic get popularity => _popularity;

  String? get posterPath => _posterPath;

  String? get releaseDate => _releaseDate;

  String? get title => _title;

  bool? get video => _video;

  dynamic get voteAverage => _voteAverage;

  int? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    map['genre_ids'] = _genreIds;
    map['id'] = _id;
    map['media_type'] = _mediaType;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    map['release_date'] = _releaseDate;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }
}
