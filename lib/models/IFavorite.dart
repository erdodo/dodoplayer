class IFavorite {
  String? kullanici;
  int? tmdb;
  bool? film;
  bool? dizi;

  IFavorite({this.kullanici, this.tmdb, this.film, this.dizi});

  IFavorite.fromJson(Map<String, dynamic> json) {
    kullanici = json['kullanici'];
    tmdb = json['tmdb'];
    film = json['film'];
    dizi = json['dizi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kullanici'] = this.kullanici;
    data['tmdb'] = this.tmdb;
    data['film'] = this.film;
    data['dizi'] = this.dizi;
    return data;
  }
}
