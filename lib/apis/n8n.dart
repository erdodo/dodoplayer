import 'dart:convert';

import 'package:dodoplayer/models/IFavorite.dart';
import 'package:dodoplayer/models/IProfile.dart';
import 'package:http/http.dart' as http;

class N8N {
  Future<IProfile> login(String username, String password) async {
    var url =
        'https://n8n.erdoganyesil.org/webhook/erdoflix-login?username=$username&password=$password';
    var headers = {"accept": 'application/json'};

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Giriş başarısız oldu');
    }

    final jsonData = jsonDecode(res.body);

    // API bir liste döndürüyorsa ilk elemanı al
    if (jsonData is List && jsonData.isNotEmpty) {
      return IProfile.fromJson(jsonData[0]);
    }

    // API bir obje döndürüyorsa direkt kullan
    return IProfile.fromJson(jsonData);
  }

  Future<void> addFavorite(int tmdbId, bool isMovie, String username) async {
    var type = isMovie ? 'film' : 'dizi';
    var url =
        'https://n8n.erdoganyesil.org/webhook/erdoflix-favori-ekle?username=$username&tmdb=$tmdbId&$type=true';
    var headers = {"accept": 'application/json'};

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Favori ekleme başarısız oldu');
    }
  }

  Future<List<IFavorite>> getFavorites(String username) async {
    var url =
        'https://n8n.erdoganyesil.org/webhook/erdoflix-favori-listesi?username=$username';
    var headers = {"accept": 'application/json'};

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Favori listeleme başarısız oldu');
    }

    final jsonData = jsonDecode(res.body) as List;

    return jsonData.map((item) => IFavorite.fromJson(item)).toList();
  }
}
