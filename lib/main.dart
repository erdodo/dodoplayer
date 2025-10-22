import 'package:dodoplayer/apis/n8n.dart';
import 'package:dodoplayer/apis/tmdb.dart';
import 'package:dodoplayer/pages/movies/MovieDetail.dart';
import 'package:dodoplayer/pages/sign/LoginPage.dart';
import 'package:dodoplayer/widgets/Carousel.dart';
import 'package:dodoplayer/widgets/MoviesRow.dart';
import 'package:dodoplayer/widgets/TVRow.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ErdoFlix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.red,
          surface: Colors.black,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MyHomePage(title: 'ErdoFlix'),
      },
      home: const AuthCheck(),
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool _isLoading = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    print('Login kontrolü başlatıldı');
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      print('Login durumu: $isLoggedIn');

      if (mounted) {
        setState(() {
          _isLoggedIn = isLoggedIn;
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Login kontrolü hatası: $e');
      if (mounted) {
        setState(() {
          _isLoggedIn = false;
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.red),
        ),
      );
    }

    return _isLoggedIn
        ? const MyHomePage(title: 'ErdoFlix')
        : const LoginPage();
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) =>
    {
      N8N().getFavorites(value.getString('username') ?? '')
    });  

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
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MovieDetail(movieId: id),));

                        },
                      );
                    }
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
    );
  }
}
