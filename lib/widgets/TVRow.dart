import 'package:dodoplayer/models/ITVSeries.dart';
import 'package:dodoplayer/pages/tvseries/TVDetail.dart';
import 'package:flutter/material.dart';

class TVrow extends StatefulWidget {
  const TVrow({
    super.key,
    required List<ITVResult> this.results,
    required this.title,
  });

  final List<ITVResult> results;
  final String title;

  @override
  State<TVrow> createState() =>
      _TVrowState(results: this.results, title: this.title);
}

class _TVrowState extends State<TVrow> {
  final List<ITVResult> results;
  final String title;

  _TVrowState({this.results = const [], this.title = ''});

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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return TVDetail(tvId: movie.id ?? 0);
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
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
