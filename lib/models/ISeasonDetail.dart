import 'dart:convert';

class ISeasonDetail {
  const ISeasonDetail({
    this.air_date,
    this.episodes,
    this.name,
    this.networks,
    this.overview,
    this.id,
    this.poster_path,
    this.season_number,
    this.vote_average,
  });

  factory ISeasonDetail.fromMap(Map<String, dynamic> map) {
    return ISeasonDetail(
      air_date: map['air_date'] as String?,
      episodes: map['episodes'] != null
          ? (map['episodes'] as List<dynamic>)
                .map((e) => EpisodesItem.fromMap(e as Map<String, dynamic>))
                .toList()
          : null,
      name: map['name'] as String?,
      networks: map['networks'] != null
          ? (map['networks'] as List<dynamic>)
                .map((e) => NetworksItem.fromMap(e as Map<String, dynamic>))
                .toList()
          : null,
      overview: map['overview'] as String?,
      id: map['id'] as int?,
      poster_path: map['poster_path'] as String?,
      season_number: map['season_number'] as int?,
      vote_average: map['vote_average'] != null
          ? (map['vote_average'] is int
                ? (map['vote_average'] as int).toDouble()
                : map['vote_average'] as double?)
          : null,
    );
  }

  factory ISeasonDetail.fromJson(String source) =>
      ISeasonDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? air_date;
  final List<EpisodesItem>? episodes;
  final String? name;
  final List<NetworksItem>? networks;
  final String? overview;
  final int? id;
  final String? poster_path;
  final int? season_number;
  final double? vote_average;

  Map<String, dynamic> toMap() {
    return {
      'air_date': air_date,
      'episodes': episodes?.map((x) => x.toMap()).toList(),
      'name': name,
      'networks': networks?.map((x) => x.toMap()).toList(),
      'overview': overview,
      'id': id,
      'poster_path': poster_path,
      'season_number': season_number,
      'vote_average': vote_average,
    };
  }

  String toJson() => json.encode(toMap());

  ISeasonDetail copyWith({
    String? air_date,
    List<EpisodesItem>? episodes,
    String? name,
    List<NetworksItem>? networks,
    String? overview,
    int? id,
    String? poster_path,
    int? season_number,
    double? vote_average,
  }) {
    return ISeasonDetail(
      air_date: air_date ?? this.air_date,
      episodes: episodes ?? this.episodes,
      name: name ?? this.name,
      networks: networks ?? this.networks,
      overview: overview ?? this.overview,
      id: id ?? this.id,
      poster_path: poster_path ?? this.poster_path,
      season_number: season_number ?? this.season_number,
      vote_average: vote_average ?? this.vote_average,
    );
  }

  @override
  List<Object?> get props => [
    air_date,
    episodes,
    name,
    networks,
    overview,
    id,
    poster_path,
    season_number,
    vote_average,
  ];
}

class EpisodesItem {
  const EpisodesItem({
    this.air_date,
    this.episode_number,
    this.episode_type,
    this.id,
    this.name,
    this.overview,
    this.production_code,
    this.runtime,
    this.season_number,
    this.show_id,
    this.still_path,
    this.vote_average,
    this.vote_count,
    this.crew,
    this.guest_stars,
  });

  factory EpisodesItem.fromMap(Map<String, dynamic> map) {
    return EpisodesItem(
      air_date: map['air_date'] as String?,
      episode_number: map['episode_number'] as int?,
      episode_type: map['episode_type'] as String?,
      id: map['id'] as int?,
      name: map['name'] as String?,
      overview: map['overview'] as String?,
      production_code: map['production_code'] as String?,
      runtime: map['runtime'] as int?,
      season_number: map['season_number'] as int?,
      show_id: map['show_id'] as int?,
      still_path: map['still_path'] as String?,
      vote_average: map['vote_average'] != null
          ? (map['vote_average'] is int
                ? (map['vote_average'] as int).toDouble()
                : map['vote_average'] as double?)
          : null,
      vote_count: map['vote_count'] as int?,
      crew: map['crew'] != null
          ? (map['crew'] as List<dynamic>)
                .map((e) => CrewItem.fromMap(e as Map<String, dynamic>))
                .toList()
          : null,
      guest_stars: map['guest_stars'] != null
          ? (map['guest_stars'] as List<dynamic>)
                .map((e) => GuestStarsItem.fromMap(e as Map<String, dynamic>))
                .toList()
          : null,
    );
  }

  factory EpisodesItem.fromJson(String source) =>
      EpisodesItem.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? air_date;
  final int? episode_number;
  final String? episode_type;
  final int? id;
  final String? name;
  final String? overview;
  final String? production_code;
  final int? runtime;
  final int? season_number;
  final int? show_id;
  final String? still_path;
  final double? vote_average;
  final int? vote_count;
  final List<CrewItem>? crew;
  final List<GuestStarsItem>? guest_stars;

  Map<String, dynamic> toMap() {
    return {
      'air_date': air_date,
      'episode_number': episode_number,
      'episode_type': episode_type,
      'id': id,
      'name': name,
      'overview': overview,
      'production_code': production_code,
      'runtime': runtime,
      'season_number': season_number,
      'show_id': show_id,
      'still_path': still_path,
      'vote_average': vote_average,
      'vote_count': vote_count,
      'crew': crew?.map((x) => x.toMap()).toList(),
      'guest_stars': guest_stars?.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  EpisodesItem copyWith({
    String? air_date,
    int? episode_number,
    String? episode_type,
    int? id,
    String? name,
    String? overview,
    String? production_code,
    int? runtime,
    int? season_number,
    int? show_id,
    String? still_path,
    double? vote_average,
    int? vote_count,
    List<CrewItem>? crew,
    List<GuestStarsItem>? guest_stars,
  }) {
    return EpisodesItem(
      air_date: air_date ?? this.air_date,
      episode_number: episode_number ?? this.episode_number,
      episode_type: episode_type ?? this.episode_type,
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      production_code: production_code ?? this.production_code,
      runtime: runtime ?? this.runtime,
      season_number: season_number ?? this.season_number,
      show_id: show_id ?? this.show_id,
      still_path: still_path ?? this.still_path,
      vote_average: vote_average ?? this.vote_average,
      vote_count: vote_count ?? this.vote_count,
      crew: crew ?? this.crew,
      guest_stars: guest_stars ?? this.guest_stars,
    );
  }

  @override
  List<Object?> get props => [
    air_date,
    episode_number,
    episode_type,
    id,
    name,
    overview,
    production_code,
    runtime,
    season_number,
    show_id,
    still_path,
    vote_average,
    vote_count,
    crew,
    guest_stars,
  ];
}

class NetworksItem {
  const NetworksItem({this.id, this.logo_path, this.name, this.origin_country});

  factory NetworksItem.fromMap(Map<String, dynamic> map) {
    return NetworksItem(
      id: map['id'] as int?,
      logo_path: map['logo_path'] as String?,
      name: map['name'] as String?,
      origin_country: map['origin_country'] as String?,
    );
  }

  factory NetworksItem.fromJson(String source) =>
      NetworksItem.fromMap(json.decode(source) as Map<String, dynamic>);

  final int? id;
  final String? logo_path;
  final String? name;
  final String? origin_country;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logo_path': logo_path,
      'name': name,
      'origin_country': origin_country,
    };
  }

  String toJson() => json.encode(toMap());

  NetworksItem copyWith({
    int? id,
    String? logo_path,
    String? name,
    String? origin_country,
  }) {
    return NetworksItem(
      id: id ?? this.id,
      logo_path: logo_path ?? this.logo_path,
      name: name ?? this.name,
      origin_country: origin_country ?? this.origin_country,
    );
  }

  @override
  List<Object?> get props => [id, logo_path, name, origin_country];
}

class CrewItem {
  const CrewItem({
    this.department,
    this.job,
    this.credit_id,
    this.adult,
    this.gender,
    this.id,
    this.known_for_department,
    this.name,
    this.original_name,
    this.popularity,
    this.profile_path,
  });

  factory CrewItem.fromMap(Map<String, dynamic> map) {
    return CrewItem(
      department: map['department'] as String?,
      job: map['job'] as String?,
      credit_id: map['credit_id'] as String?,
      adult: map['adult'] as bool?,
      gender: map['gender'] as int?,
      id: map['id'] as int?,
      known_for_department: map['known_for_department'] as String?,
      name: map['name'] as String?,
      original_name: map['original_name'] as String?,
      popularity: map['popularity'] as double?,
      profile_path: map['profile_path'] as String?,
    );
  }

  factory CrewItem.fromJson(String source) =>
      CrewItem.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? department;
  final String? job;
  final String? credit_id;
  final bool? adult;
  final int? gender;
  final int? id;
  final String? known_for_department;
  final String? name;
  final String? original_name;
  final double? popularity;
  final String? profile_path;

  Map<String, dynamic> toMap() {
    return {
      'department': department,
      'job': job,
      'credit_id': credit_id,
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': known_for_department,
      'name': name,
      'original_name': original_name,
      'popularity': popularity,
      'profile_path': profile_path,
    };
  }

  String toJson() => json.encode(toMap());

  CrewItem copyWith({
    String? department,
    String? job,
    String? credit_id,
    bool? adult,
    int? gender,
    int? id,
    String? known_for_department,
    String? name,
    String? original_name,
    double? popularity,
    String? profile_path,
  }) {
    return CrewItem(
      department: department ?? this.department,
      job: job ?? this.job,
      credit_id: credit_id ?? this.credit_id,
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      known_for_department: known_for_department ?? this.known_for_department,
      name: name ?? this.name,
      original_name: original_name ?? this.original_name,
      popularity: popularity ?? this.popularity,
      profile_path: profile_path ?? this.profile_path,
    );
  }

  @override
  List<Object?> get props => [
    department,
    job,
    credit_id,
    adult,
    gender,
    id,
    known_for_department,
    name,
    original_name,
    popularity,
    profile_path,
  ];
}

class GuestStarsItem {
  const GuestStarsItem({
    this.character,
    this.credit_id,
    this.order,
    this.adult,
    this.gender,
    this.id,
    this.known_for_department,
    this.name,
    this.original_name,
    this.popularity,
    this.profile_path,
  });

  factory GuestStarsItem.fromMap(Map<String, dynamic> map) {
    return GuestStarsItem(
      character: map['character'] as String?,
      credit_id: map['credit_id'] as String?,
      order: map['order'] as int?,
      adult: map['adult'] as bool?,
      gender: map['gender'] as int?,
      id: map['id'] as int?,
      known_for_department: map['known_for_department'] as String?,
      name: map['name'] as String?,
      original_name: map['original_name'] as String?,
      popularity: map['popularity'] as double?,
      profile_path: map['profile_path'] as String?,
    );
  }

  factory GuestStarsItem.fromJson(String source) =>
      GuestStarsItem.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? character;
  final String? credit_id;
  final int? order;
  final bool? adult;
  final int? gender;
  final int? id;
  final String? known_for_department;
  final String? name;
  final String? original_name;
  final double? popularity;
  final String? profile_path;

  Map<String, dynamic> toMap() {
    return {
      'character': character,
      'credit_id': credit_id,
      'order': order,
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': known_for_department,
      'name': name,
      'original_name': original_name,
      'popularity': popularity,
      'profile_path': profile_path,
    };
  }

  String toJson() => json.encode(toMap());

  GuestStarsItem copyWith({
    String? character,
    String? credit_id,
    int? order,
    bool? adult,
    int? gender,
    int? id,
    String? known_for_department,
    String? name,
    String? original_name,
    double? popularity,
    String? profile_path,
  }) {
    return GuestStarsItem(
      character: character ?? this.character,
      credit_id: credit_id ?? this.credit_id,
      order: order ?? this.order,
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      known_for_department: known_for_department ?? this.known_for_department,
      name: name ?? this.name,
      original_name: original_name ?? this.original_name,
      popularity: popularity ?? this.popularity,
      profile_path: profile_path ?? this.profile_path,
    );
  }

  @override
  List<Object?> get props => [
    character,
    credit_id,
    order,
    adult,
    gender,
    id,
    known_for_department,
    name,
    original_name,
    popularity,
    profile_path,
  ];
}
