class IMovieDetail {
  final bool adult;
  final String? backdrop_path;
  final dynamic belongs_to_collection;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String? imdb_id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String? poster_path;
  final List<ProductionCompany> production_companies;
  final List<ProductionCountry> production_countries;
  final String release_date;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spoken_languages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double vote_average;
  final int vote_count;

  IMovieDetail({
    required this.adult,
    required this.backdrop_path,
    required this.belongs_to_collection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdb_id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.production_companies,
    required this.production_countries,
    required this.release_date,
    required this.revenue,
    required this.runtime,
    required this.spoken_languages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  factory IMovieDetail.fromJson(Map<String, dynamic> json) {
    return IMovieDetail(
      adult: json['adult'] ?? false,
      backdrop_path: json['backdrop_path'],
      belongs_to_collection: json['belongs_to_collection'],
      budget: json['budget'] ?? 0,
      genres: (json['genres'] as List).map((e) => Genre.fromJson(e)).toList(),
      homepage: json['homepage'],
      id: json['id'],
      imdb_id: json['imdb_id'],
      original_language: json['original_language'] ?? '',
      original_title: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      poster_path: json['poster_path'],
      production_companies: (json['production_companies'] as List)
          .map((e) => ProductionCompany.fromJson(e))
          .toList(),
      production_countries: (json['production_countries'] as List)
          .map((e) => ProductionCountry.fromJson(e))
          .toList(),
      release_date: json['release_date'] ?? '',
      revenue: json['revenue'] ?? 0,
      runtime: json['runtime'] ?? 0,
      spoken_languages: (json['spoken_languages'] as List)
          .map((e) => SpokenLanguage.fromJson(e))
          .toList(),
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      vote_average: (json['vote_average'] ?? 0).toDouble(),
      vote_count: json['vote_count'] ?? 0,
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'], name: json['name'] ?? '');
  }
}

class ProductionCompany {
  final int id;
  final String? logo_path;
  final String name;
  final String origin_country;

  ProductionCompany({
    required this.id,
    required this.logo_path,
    required this.name,
    required this.origin_country,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logo_path: json['logo_path'],
      name: json['name'] ?? '',
      origin_country: json['origin_country'] ?? '',
    );
  }
}

class ProductionCountry {
  final String iso_3166_1;
  final String name;

  ProductionCountry({required this.iso_3166_1, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso_3166_1: json['iso_3166_1'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class SpokenLanguage {
  final String english_name;
  final String iso_639_1;
  final String name;

  SpokenLanguage({
    required this.english_name,
    required this.iso_639_1,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      english_name: json['english_name'] ?? '',
      iso_639_1: json['iso_639_1'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
