import 'package:dodoplayer/apis/n8n.dart';
import 'package:dodoplayer/models/IFavorite.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<IFavorite> _favorites = [];
  bool _isLoading = false;
  String? _username;

  List<IFavorite> get favorites => _favorites;

  bool get isLoading => _isLoading;

  // Kullanıcı adını ayarla
  void setUsername(String username) {
    _username = username;
  }

  // Favorileri yükle
  Future<void> loadFavorites(String username) async {
    _username = username;
    _isLoading = true;
    notifyListeners();

    try {
      _favorites = await N8N().getFavorites(username);
    } catch (e) {
      print('Favoriler yüklenirken hata: $e');
      _favorites = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Bir film/dizinin favori olup olmadığını kontrol et
  bool isFavorite(int tmdbId, bool isMovie) {
    return _favorites.any(
      (fav) =>
          fav.tmdb == tmdbId &&
          (isMovie ? (fav.film == true) : (fav.dizi == true)),
    );
  }

  // Favorilere ekle
  Future<void> addFavorite(int tmdbId, bool isMovie) async {
    if (_username == null) return;

    try {
      await N8N().addFavorite(tmdbId, isMovie, _username!);

      // Listeye ekle
      _favorites.add(
        IFavorite(
          kullanici: _username,
          tmdb: tmdbId,
          film: isMovie,
          dizi: !isMovie,
        ),
      );

      notifyListeners();
    } catch (e) {
      print('Favoriye eklenirken hata: $e');
      rethrow;
    }
  }

  // Favorilerden çıkar
  Future<void> removeFavorite(int tmdbId, bool isMovie) async {
    if (_username == null) return;

    try {
      // API'den silme işlemi varsa buraya eklenebilir

      // Listeden çıkar
      _favorites.removeWhere(
        (fav) =>
            fav.tmdb == tmdbId &&
            (isMovie ? (fav.film == true) : (fav.dizi == true)),
      );

      notifyListeners();
    } catch (e) {
      print('Favoriden çıkarılırken hata: $e');
      rethrow;
    }
  }

  // Toggle favori durumu
  Future<void> toggleFavorite(int tmdbId, bool isMovie) async {
    if (isFavorite(tmdbId, isMovie)) {
      await removeFavorite(tmdbId, isMovie);
    } else {
      await addFavorite(tmdbId, isMovie);
    }
  }

  // Favorileri temizle (logout için)
  void clearFavorites() {
    _favorites = [];
    _username = null;
    notifyListeners();
  }
}
