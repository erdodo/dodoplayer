import 'package:dodoplayer/apis/tmdb.dart';
import 'package:dodoplayer/models/IMovieDetail.dart';
import 'package:dodoplayer/providers/GlobalProvider.dart';
import 'package:dodoplayer/widgets/MoviesRow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key, required this.movieId});

  final int movieId;

  @override
  State<MovieDetail> createState() => _MovieDetailState(movieId: this.movieId);
}

class _MovieDetailState extends State<MovieDetail> {
  final int movieId;
  late Color color = Colors.grey;
  IMovieDetail? movieDetail;

  _MovieDetailState({this.movieId = 0});

  getMovieDetail() async {
    this.movieDetail = await TMDB().getMovieDetail(movieId);
    var snapshot = this.movieDetail;
    this.color =
        (snapshot!.vote_average >= 7.0
                ? Colors.green
                : (snapshot.vote_average) >= 4.0
                ? Colors.orange
                : Colors.red)
            as Color;
  }

  onPressWatch() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black54, title: Text('ErdoFlix')),
      body: FutureBuilder(
        future: getMovieDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Scaffold(
            body: Scrollable(
              viewportBuilder: (context, position) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    spacing: 0,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Resim
                      Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.fromLTRB(
                            bottom: BorderSide(color: Colors.redAccent),
                          ),
                        ),
                        height: 240,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movieDetail?.backdrop_path ?? movieDetail?.poster_path ?? ''}',
                          fit: BoxFit.cover,
                        ),
                      ),

                      //Başlık
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          movieDetail?.title ?? '',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //Yıl ve Puan
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 4),
                            child: Text(
                              '${movieDetail?.release_date.split('-')[0] ?? ''}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 4),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: this.color, size: 14),
                                SizedBox(width: 4),
                                Text(
                                  '${movieDetail?.vote_average.toStringAsFixed(1) ?? ''}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: this.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      //Şimdi izle
                      Container(
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: ElevatedButton(
                          onPressed: onPressWatch,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow, color: Colors.black),
                              SizedBox(width: 4),
                              Text(
                                'Şimdi İzle',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //İndir
                      Container(
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: ElevatedButton(
                          onPressed: onPressWatch,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_downward, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                'İndir',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Türler ve Butonlar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Türler
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 16, 0, 16),
                            alignment: Alignment.centerLeft,
                            width: 250,
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: movieDetail!.genres.map((genre) {
                                return Container(
                                  padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey[800],
                                  ),
                                  child: Text(
                                    genre.name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              //favoriye ekle, listeye ekle, paylaş
                              Container(
                                child: Consumer<GlobalProvider>(
                                  builder: (context, favoritesProvider, child) {
                                    final isFavorite = favoritesProvider
                                        .isFavorite(movieId, true);
                                    return IconButton(
                                      onPressed: () {
                                        favoritesProvider.toggleFavorite(
                                          movieId,
                                          true,
                                          movieDetail?.backdrop_path ?? '',
                                          movieDetail?.title ?? '',
                                        );
                                      },
                                      icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: isFavorite
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add, color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.share, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //Açıklama
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(8),
                        child: Text(
                          movieDetail?.overview ?? '',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),

                      //Yapım Şirketleri
                      Scrollable(
                        viewportBuilder: (context, position) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8, 16, 0, 16),
                              alignment: Alignment.centerLeft,

                              child: Row(
                                children: movieDetail!.production_companies.map((
                                  genre,
                                ) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.fromLTRB(6, 2, 6, 2),

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        genre.logo_path != null
                                            ? Image.network(
                                                'https://image.tmdb.org/t/p/w200${genre.logo_path}',
                                                height: 50,
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),

                      FutureBuilder(
                        future: TMDB().getMovieSimilar(movieId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return Moviesrow(
                              results: snapshot.data?.results ?? [],
                              title: 'Benzer Filmler',
                            );
                          }
                        },
                      ),
                      Container(height: 100),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
