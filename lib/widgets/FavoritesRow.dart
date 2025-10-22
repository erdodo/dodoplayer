import 'package:dodoplayer/models/IFavorite.dart';
import 'package:flutter/material.dart';

import '../pages/movies/MovieDetail.dart';

class Favoritesrow extends StatefulWidget {
  const Favoritesrow({
    super.key,
    required List<IFavorite> this.results,
    required this.title,
  });

  final List<IFavorite> results;
  final String title;

  @override
  State<Favoritesrow> createState() =>
      _FavoritesrowState(results: this.results, title: this.title);
}

class _FavoritesrowState extends State<Favoritesrow> {
  final List<IFavorite> results;
  final String title;

  _FavoritesrowState({this.results = const [], this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                            return MovieDetail(movieId: movie.tmdb!);
                          },
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${movie.image_path}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: 300,
                          height: 150,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              movie?.title ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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
