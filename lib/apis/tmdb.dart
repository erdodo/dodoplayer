import 'dart:convert';

import 'package:dodoplayer/models/MovieDetail.dart';
import 'package:dodoplayer/models/Movies.dart';
import 'package:dodoplayer/models/TVSeries.dart';
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
}
