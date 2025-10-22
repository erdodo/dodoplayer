import 'package:dodoplayer/apis/tmdb.dart';
import 'package:dodoplayer/models/ITVDetail.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class SeasonDetail extends StatefulWidget {
  const SeasonDetail({super.key, required this.tvId, required this.season});

  final int tvId;
  final List<Season> season;

  @override
  State<SeasonDetail> createState() =>
      _SeasonDetailState(tvId: this.tvId, season: this.season);
}

class _SeasonDetailState extends State<SeasonDetail> {
  final int tvId;
  final List<Season> season;

  _SeasonDetailState({this.tvId = 0, this.season = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: season.map((s) {
        return GFAccordion(
          title: 'Sezon ${s.season_number}',
          collapsedIcon: Icon(Icons.expand_more),
          expandedIcon: Icon(Icons.expand_less),
          collapsedTitleBackgroundColor: Colors.black26,
          expandedTitleBackgroundColor: Colors.black38,
          textStyle: TextStyle(color: Colors.white),
          contentBackgroundColor: Colors.black26,
          titleBorder: Border(
            bottom: BorderSide(color: Colors.redAccent, width: 0.5),
          ),
          contentChild: FutureBuilder(
            future: TMDB().getSeasonDetail(tvId, s.season_number),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Hata: ${snapshot.error}',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Veri bulunamadı'),
                );
              }

              if (snapshot.data?.episodes == null ||
                  snapshot.data!.episodes!.isEmpty) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Bu sezonda bölüm bulunamadı'),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: snapshot.data!.episodes!.map((e) {
                  return TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.zero,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Column(
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),

                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w200${e.still_path}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: 120,
                                height: 60,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    '${e.episode_number}. ${e.name ?? 'Bölüm'}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${e.runtime.toString()}dk',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            e.overview!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
