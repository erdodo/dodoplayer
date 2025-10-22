import 'package:dodoplayer/apis/n8n.dart';
import 'package:dodoplayer/apis/tmdb.dart';
import 'package:dodoplayer/pages/movies/MovieDetail.dart';
import 'package:dodoplayer/providers/GlobalProvider.dart';
import 'package:dodoplayer/widgets/Carousel.dart';
import 'package:dodoplayer/widgets/FavoritesRow.dart';
import 'package:dodoplayer/widgets/MoviesRow.dart';
import 'package:dodoplayer/widgets/TVRow.dart';
import 'package:dodoplayer/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then(
      (value) => {N8N().getFavorites(value.getString('username') ?? '')},
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: Scrollable(
        viewportBuilder: (context, position) {
          return SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: TMDB().getNowPlayingMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Carousel(
                        items:
                            snapshot.data?.results
                                .map(
                                  (movie) => CarouselItem(
                                    id: movie.id,
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                                    title: movie.title,
                                  ),
                                )
                                .toList() ??
                            [],
                        onWatch: (id) {
                          print('İzle butonuna tıklandı');
                          print(id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetail(movieId: id),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                Consumer<GlobalProvider>(
                  builder: (context, favoritesProvider, child) {
                    if (favoritesProvider.favorites.isNotEmpty) {
                      return Favoritesrow(
                        results: favoritesProvider.favorites,
                        title: "Favoriler",
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),

                FutureBuilder(
                  future: TMDB().getPopularMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Moviesrow(
                        results: snapshot.data?.results ?? [],
                        title: 'Popüler Filmler',
                      );
                    }
                  },
                ),

                FutureBuilder(
                  future: TMDB().getUpcomingMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Moviesrow(
                        results: snapshot.data?.results ?? [],
                        title: 'Yeni Eklenen Filmler',
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: TMDB().getPopularTV(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return TVrow(
                        results: snapshot.data?.results ?? [],
                        title: 'Popüler Diziler',
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: BottomBarNavigation(),
    );
  }
}
