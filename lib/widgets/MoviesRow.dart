import 'package:dodoplayer/models/Movies.dart';
import 'package:flutter/material.dart';

import '../pages/movies/MovieDetail.dart';

class Moviesrow extends StatefulWidget {
  const Moviesrow({
    super.key,
    required List<IMovieResult> this.results,
    required this.title,
  });

  final List<IMovieResult> results;
  final String title;

  @override
  State<Moviesrow> createState() =>
      _MoviesrowState(results: this.results, title: this.title);
}

class _MoviesrowState extends State<Moviesrow> {
  final List<IMovieResult> results;
  final String title;

  _MoviesrowState({this.results = const [], this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 4),
          alignment: Alignment.centerLeft,
          child: Text(
            this.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Scrollable(
          viewportBuilder: (context, position) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                spacing: 6,

                children: results.map((movie) {
                  return TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.zero,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return MovieDetail(movieId: movie.id);
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                          ),
                        ),
                      ),
                      width: 100,
                      height: 150,
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
