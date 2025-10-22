class IFavorite {
  String? kullanici;
  int? tmdb;
  bool? film;
  bool? dizi;
  int? row_number;
  String? image_path;
  String? title;

  IFavorite(
      {this.kullanici, this.tmdb, this.film, this.dizi, this.row_number, this.image_path, this.title});

  IFavorite.fromJson(Map<String, dynamic> json) {
    kullanici = json['kullanici'];
    tmdb = json['tmdb'] is String ? int.tryParse(json['tmdb']) : json['tmdb'];
    film = json['film'];
    dizi = json['dizi'];
    row_number = json['row_number'] is String
        ? int.tryParse(json['row_number'])
        : json['row_number'];
    image_path = json['image_path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kullanici'] = this.kullanici;
    data['tmdb'] = this.tmdb;
    data['film'] = this.film;
    data['dizi'] = this.dizi;
    data['row_number'] = this.row_number;
    data['image_path'] = this.image_path;
    data['title'] = this.title;
    return data;
  }
}
