class ISearch {
  int? page;
  List<Results>? results;
  int? total_pages;
  int? total_results;

  ISearch({this.page, this.results, this.total_pages, this.total_results});

  ISearch.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    total_pages = json['total_pages'];
    total_results = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.total_pages;
    data['total_results'] = this.total_results;
    return data;
  }
}

class Results {
  bool? adult;
  String? backdrop_path;
  int? id;
  String? title;
  String? original_title;
  String? overview;
  String? poster_path;
  String? media_type;
  String? original_language;
  List<int>? genre_ids;
  double? popularity;
  String? release_date;
  bool? video;
  double? vote_average;
  int? vote_count;
  String? name;
  String? original_name;
  int? gender;
  String? known_for_department;
  String? profile_path;
  List<KnownFor>? known_for;

  Results({
    this.adult,
    this.backdrop_path,
    this.id,
    this.title,
    this.original_title,
    this.overview,
    this.poster_path,
    this.media_type,
    this.original_language,
    this.genre_ids,
    this.popularity,
    this.release_date,
    this.video,
    this.vote_average,
    this.vote_count,
    this.name,
    this.original_name,
    this.gender,
    this.known_for_department,
    this.profile_path,
    this.known_for,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdrop_path = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    original_title = json['original_title'];
    overview = json['overview'];
    poster_path = json['poster_path'];
    media_type = json['media_type'];
    original_language = json['original_language'];
    genre_ids = json['genre_ids']?.cast<int>();
    popularity = json['popularity'];
    release_date = json['release_date'];
    video = json['video'];
    vote_average = json['vote_average'];
    vote_count = json['vote_count'];
    name = json['name'];
    original_name = json['original_name'];
    gender = json['gender'];
    known_for_department = json['known_for_department'];
    profile_path = json['profile_path'];
    if (json['known_for'] != null) {
      known_for = <KnownFor>[];
      json['known_for'].forEach((v) {
        known_for!.add(KnownFor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdrop_path;
    data['id'] = this.id;
    data['title'] = this.title;
    data['original_title'] = this.original_title;
    data['overview'] = this.overview;
    data['poster_path'] = this.poster_path;
    data['media_type'] = this.media_type;
    data['original_language'] = this.original_language;
    data['genre_ids'] = this.genre_ids;
    data['popularity'] = this.popularity;
    data['release_date'] = this.release_date;
    data['video'] = this.video;
    data['vote_average'] = this.vote_average;
    data['vote_count'] = this.vote_count;
    data['name'] = this.name;
    data['original_name'] = this.original_name;
    data['gender'] = this.gender;
    data['known_for_department'] = this.known_for_department;
    data['profile_path'] = this.profile_path;
    if (this.known_for != null) {
      data['known_for'] = this.known_for!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KnownFor {
  bool? adult;
  String? backdrop_path;
  int? id;
  String? title;
  String? original_title;
  String? overview;
  String? poster_path;
  String? media_type;
  String? original_language;
  List<int>? genre_ids;
  double? popularity;
  String? release_date;
  bool? video;
  double? vote_average;
  int? vote_count;

  KnownFor({
    this.adult,
    this.backdrop_path,
    this.id,
    this.title,
    this.original_title,
    this.overview,
    this.poster_path,
    this.media_type,
    this.original_language,
    this.genre_ids,
    this.popularity,
    this.release_date,
    this.video,
    this.vote_average,
    this.vote_count,
  });

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdrop_path = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    original_title = json['original_title'];
    overview = json['overview'];
    poster_path = json['poster_path'];
    media_type = json['media_type'];
    original_language = json['original_language'];
    genre_ids = json['genre_ids']?.cast<int>();
    popularity = json['popularity'];
    release_date = json['release_date'];
    video = json['video'];
    vote_average = json['vote_average'];
    vote_count = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdrop_path;
    data['id'] = this.id;
    data['title'] = this.title;
    data['original_title'] = this.original_title;
    data['overview'] = this.overview;
    data['poster_path'] = this.poster_path;
    data['media_type'] = this.media_type;
    data['original_language'] = this.original_language;
    data['genre_ids'] = this.genre_ids;
    data['popularity'] = this.popularity;
    data['release_date'] = this.release_date;
    data['video'] = this.video;
    data['vote_average'] = this.vote_average;
    data['vote_count'] = this.vote_count;
    return data;
  }
}
