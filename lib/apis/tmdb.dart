import 'dart:convert';

import 'package:dodoplayer/models/IMovieDetail.dart';
import 'package:dodoplayer/models/IMovies.dart';
import 'package:dodoplayer/models/ISeasonDetail.dart';
import 'package:dodoplayer/models/ITVDetail.dart';
import 'package:dodoplayer/models/ITVSeries.dart';
import 'package:http/http.dart' as http;

class TMDB {
  Future<IMovies> getPopularMovies() async {
    var url =
        'https://api.themoviedb.org/3/movie/popular?language=tr-TR&page=1';
    var headers = {
      "accept": 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZmQ0YjM4ZmZhZjFhMjUyMzNlNDYxZjU2MGE5ZmUwMCIsIm5iZiI6MTcxNzEwMTgyMC4yNTMsInN1YiI6IjY2NThlNGZjOWVmNDcxOGFlNjkzZjAxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jx4WuIJRI4sHPAMiC9N7F8vF2kRLOA9AcjL1PVNvX-w',
    };

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Failed to load popular movies');
    }

    final jsonData = jsonDecode(res.body);
    return IMovies.fromJson(jsonData);
  }

  Future<IMovies> getNowPlayingMovies() async {
    var url =
        'https://api.themoviedb.org/3/movie/now_playing?language=tr-TR&page=1&region=tr';
    var headers = {
      "accept": 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZmQ0YjM4ZmZhZjFhMjUyMzNlNDYxZjU2MGE5ZmUwMCIsIm5iZiI6MTcxNzEwMTgyMC4yNTMsInN1YiI6IjY2NThlNGZjOWVmNDcxOGFlNjkzZjAxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jx4WuIJRI4sHPAMiC9N7F8vF2kRLOA9AcjL1PVNvX-w',
    };

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Failed to load popular movies');
    }

    final jsonData = jsonDecode(res.body);
    return IMovies.fromJson(jsonData);
  }

  Future<IMovies> getUpcomingMovies() async {
    var url =
        'https://api.themoviedb.org/3/movie/upcoming?language=tr-TR&page=1';
    var headers = {
      "accept": 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZmQ0YjM4ZmZhZjFhMjUyMzNlNDYxZjU2MGE5ZmUwMCIsIm5iZiI6MTcxNzEwMTgyMC4yNTMsInN1YiI6IjY2NThlNGZjOWVmNDcxOGFlNjkzZjAxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jx4WuIJRI4sHPAMiC9N7F8vF2kRLOA9AcjL1PVNvX-w',
    };

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Failed to load popular movies');
    }

    final jsonData = jsonDecode(res.body);
    return IMovies.fromJson(jsonData);
  }

  Future<IMovieDetail> getMovieDetail(int movieId) async {
    var url = 'https://api.themoviedb.org/3/movie/$movieId?language=tr-TR';
    var headers = {
      "accept": 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZmQ0YjM4ZmZhZjFhMjUyMzNlNDYxZjU2MGE5ZmUwMCIsIm5iZiI6MTcxNzEwMTgyMC4yNTMsInN1YiI6IjY2NThlNGZjOWVmNDcxOGFlNjkzZjAxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jx4WuIJRI4sHPAMiC9N7F8vF2kRLOA9AcjL1PVNvX-w',
    };

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Failed to load movie detail');
    }

    final jsonData = jsonDecode(res.body);
    return IMovieDetail.fromJson(jsonData);
  }

  Future<IMovies> getMovieSimilar(int movieId) async {
    var url =
        'https://api.themoviedb.org/3/movie/$movieId/similar?language=tr-TR&page=1';
    var headers = {
      "accept": 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZmQ0YjM4ZmZhZjFhMjUyMzNlNDYxZjU2MGE5ZmUwMCIsIm5iZiI6MTcxNzEwMTgyMC4yNTMsInN1YiI6IjY2NThlNGZjOWVmNDcxOGFlNjkzZjAxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jx4WuIJRI4sHPAMiC9N7F8vF2kRLOA9AcjL1PVNvX-w',
    };

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Failed to load movie similar');
    }

    final jsonData = jsonDecode(res.body);
    return IMovies.fromJson(jsonData);
  }

  Future<ITVSeries> getPopularTV() async {
    var url = 'https://api.themoviedb.org/3/tv/popular?language=tr-TR&page=1';
    var headers = {
      "accept": 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZmQ0YjM4ZmZhZjFhMjUyMzNlNDYxZjU2MGE5ZmUwMCIsIm5iZiI6MTcxNzEwMTgyMC4yNTMsInN1YiI6IjY2NThlNGZjOWVmNDcxOGFlNjkzZjAxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jx4WuIJRI4sHPAMiC9N7F8vF2kRLOA9AcjL1PVNvX-w',
    };

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Failed to load popular movies');
    }

    final jsonData = jsonDecode(res.body);
    return ITVSeries.fromJson(jsonData);
  }

  Future<ITvShowDetail> getTVDetail(int tvId) async {
    var url = 'https://api.themoviedb.org/3/tv/$tvId?language=tr-TR';
    var headers = {
      "accept": 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZmQ0YjM4ZmZhZjFhMjUyMzNlNDYxZjU2MGE5ZmUwMCIsIm5iZiI6MTcxNzEwMTgyMC4yNTMsInN1YiI6IjY2NThlNGZjOWVmNDcxOGFlNjkzZjAxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jx4WuIJRI4sHPAMiC9N7F8vF2kRLOA9AcjL1PVNvX-w',
    };

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Failed to load tv detail');
    }

    final jsonData = jsonDecode(res.body);
    return ITvShowDetail.fromJson(jsonData);
  }

  Future<ISeasonDetail> getSeasonDetail(int tvId, int seasonNumber) async {
    var url =
        'https://api.themoviedb.org/3/tv/$tvId/season/$seasonNumber?language=tr-TR';
    var headers = {
      "accept": 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZmQ0YjM4ZmZhZjFhMjUyMzNlNDYxZjU2MGE5ZmUwMCIsIm5iZiI6MTcxNzEwMTgyMC4yNTMsInN1YiI6IjY2NThlNGZjOWVmNDcxOGFlNjkzZjAxOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Jx4WuIJRI4sHPAMiC9N7F8vF2kRLOA9AcjL1PVNvX-w',
    };

    var res = await http.get(Uri.parse(url), headers: headers);

    if (res.statusCode != 200) {
      throw Exception('Failed to load season detail: ${res.statusCode}');
    }

    final jsonData = jsonDecode(res.body);
    return ISeasonDetail.fromMap(jsonData);
  }
}
