class IProfile {
  int? row_number;
  String? username;
  int? pass;
  String? isim;
  String? soyisim;

  IProfile({
    this.row_number,
    this.username,
    this.pass,
    this.isim,
    this.soyisim,
  });

  IProfile.fromJson(Map<String, dynamic> json) {
    row_number = json['row_number'];
    username = json['username'];
    pass = json['pass'];
    isim = json['isim'];
    soyisim = json['soyisim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row_number'] = this.row_number;
    data['username'] = this.username;
    data['pass'] = this.pass;
    data['isim'] = this.isim;
    data['soyisim'] = this.soyisim;
    return data;
  }
}
