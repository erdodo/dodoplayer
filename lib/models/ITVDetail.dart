class ITvShowDetail {
  final bool adult;
  final String? backdrop_path;
  final List<CreatedBy> created_by;
  final List<int> episode_run_time;
  final String first_air_date;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final bool in_production;
  final List<String> languages;
  final String last_air_date;
  final Episode? last_episode_to_air;
  final String name;
  final dynamic next_episode_to_air;
  final List<Network> networks;
  final int number_of_episodes;
  final int number_of_seasons;
  final List<String> origin_country;
  final String original_language;
  final String original_name;
  final String overview;
  final double popularity;
  final String? poster_path;
  final List<ProductionCompany> production_companies;
  final List<ProductionCountry> production_countries;
  final List<Season> seasons;
  final List<SpokenLanguage> spoken_languages;
  final String status;
  final String tagline;
  final String type;
  final double vote_average;
  final int vote_count;

  ITvShowDetail({
    required this.adult,
    required this.backdrop_path,
    required this.created_by,
    required this.episode_run_time,
    required this.first_air_date,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.in_production,
    required this.languages,
    required this.last_air_date,
    required this.last_episode_to_air,
    required this.name,
    required this.next_episode_to_air,
    required this.networks,
    required this.number_of_episodes,
    required this.number_of_seasons,
    required this.origin_country,
    required this.original_language,
    required this.original_name,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.production_companies,
    required this.production_countries,
    required this.seasons,
    required this.spoken_languages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.vote_average,
    required this.vote_count,
  });

  factory ITvShowDetail.fromJson(Map<String, dynamic> json) {
    return ITvShowDetail(
      adult: json['adult'] ?? false,
      backdrop_path: json['backdrop_path'],
      created_by: (json['created_by'] as List)
          .map((e) => CreatedBy.fromJson(e))
          .toList(),
      episode_run_time: List<int>.from(json['episode_run_time'] ?? []),
      first_air_date: json['first_air_date'] ?? '',
      genres: (json['genres'] as List).map((e) => Genre.fromJson(e)).toList(),
      homepage: json['homepage'],
      id: json['id'],
      in_production: json['in_production'] ?? false,
      languages: List<String>.from(json['languages'] ?? []),
      last_air_date: json['last_air_date'] ?? '',
      last_episode_to_air: json['last_episode_to_air'] != null
          ? Episode.fromJson(json['last_episode_to_air'])
          : null,
      name: json['name'] ?? '',
      next_episode_to_air: json['next_episode_to_air'],
      networks: (json['networks'] as List)
          .map((e) => Network.fromJson(e))
          .toList(),
      number_of_episodes: json['number_of_episodes'] ?? 0,
      number_of_seasons: json['number_of_seasons'] ?? 0,
      origin_country: List<String>.from(json['origin_country'] ?? []),
      original_language: json['original_language'] ?? '',
      original_name: json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      poster_path: json['poster_path'],
      production_companies: (json['production_companies'] as List)
          .map((e) => ProductionCompany.fromJson(e))
          .toList(),
      production_countries: (json['production_countries'] as List)
          .map((e) => ProductionCountry.fromJson(e))
          .toList(),
      seasons: (json['seasons'] as List)
          .map((e) => Season.fromJson(e))
          .toList(),
      spoken_languages: (json['spoken_languages'] as List)
          .map((e) => SpokenLanguage.fromJson(e))
          .toList(),
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      type: json['type'] ?? '',
      vote_average: (json['vote_average'] ?? 0).toDouble(),
      vote_count: json['vote_count'] ?? 0,
    );
  }
}

class CreatedBy {
  final int id;
  final String credit_id;
  final String name;
  final int? gender;
  final String? profile_path;

  CreatedBy({
    required this.id,
    required this.credit_id,
    required this.name,
    required this.gender,
    required this.profile_path,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json['id'],
      credit_id: json['credit_id'] ?? '',
      name: json['name'] ?? '',
      gender: json['gender'],
      profile_path: json['profile_path'],
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

class Episode {
  final int id;
  final String name;
  final String overview;
  final double vote_average;
  final int vote_count;
  final String air_date;
  final int episode_number;
  final String production_code;
  final int runtime;
  final int season_number;
  final int show_id;
  final String? still_path;

  Episode({
    required this.id,
    required this.name,
    required this.overview,
    required this.vote_average,
    required this.vote_count,
    required this.air_date,
    required this.episode_number,
    required this.production_code,
    required this.runtime,
    required this.season_number,
    required this.show_id,
    required this.still_path,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      vote_average: (json['vote_average'] ?? 0).toDouble(),
      vote_count: json['vote_count'] ?? 0,
      air_date: json['air_date'] ?? '',
      episode_number: json['episode_number'] ?? 0,
      production_code: json['production_code'] ?? '',
      runtime: json['runtime'] ?? 0,
      season_number: json['season_number'] ?? 0,
      show_id: json['show_id'] ?? 0,
      still_path: json['still_path'],
    );
  }
}

class Network {
  final int id;
  final String? logo_path;
  final String name;
  final String origin_country;

  Network({
    required this.id,
    required this.logo_path,
    required this.name,
    required this.origin_country,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      logo_path: json['logo_path'],
      name: json['name'] ?? '',
      origin_country: json['origin_country'] ?? '',
    );
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

class Season {
  final String air_date;
  final int episode_count;
  final int id;
  final String name;
  final String overview;
  final String? poster_path;
  final int season_number;
  final double vote_average;

  Season({
    required this.air_date,
    required this.episode_count,
    required this.id,
    required this.name,
    required this.overview,
    required this.poster_path,
    required this.season_number,
    required this.vote_average,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      air_date: json['air_date'] ?? '',
      episode_count: json['episode_count'] ?? 0,
      id: json['id'],
      name: json['name'] ?? '',
      overview: json['overview'] ?? '',
      poster_path: json['poster_path'],
      season_number: json['season_number'] ?? 0,
      vote_average: (json['vote_average'] ?? 0).toDouble(),
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
