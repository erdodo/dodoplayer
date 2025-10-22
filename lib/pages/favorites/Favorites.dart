import 'package:dodoplayer/pages/movies/MovieDetail.dart';
import 'package:dodoplayer/providers/GlobalProvider.dart';
import 'package:dodoplayer/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black54, title: Text("Favoriler")),
      body: Scrollable(
        viewportBuilder: (context, position) {
          return SingleChildScrollView(
            child: Consumer<GlobalProvider>(
              builder: (context, favoritesProvider, child) {
                if (favoritesProvider.favorites.isNotEmpty) {
                  return Scrollable(
                    viewportBuilder: (context, position) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Column(
                          spacing: 6,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: favoritesProvider.favorites.map((movie) {
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
                                    width:
                                        MediaQuery(
                                          data: MediaQuery.of(context),
                                          child: SizedBox(),
                                        ).data.size.width -
                                        16,
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
                                        movie.title ?? '',
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
                  );
                }
                return SizedBox.shrink();
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomBarNavigation(),
    );
  }
}
