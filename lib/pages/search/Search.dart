import 'dart:async';

import 'package:dodoplayer/apis/tmdb.dart';
import 'package:dodoplayer/models/ISearch.dart';
import 'package:dodoplayer/pages/movies/MovieDetail.dart';
import 'package:dodoplayer/pages/tvseries/TVDetail.dart';
import 'package:dodoplayer/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Results> _searchResults = [];
  bool _isLoading = false;
  bool _hasSearched = false;
  Timer? _debounceTimer;

  void _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _hasSearched = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _hasSearched = true;
    });

    try {
      final results = await TMDB().searchAny(query);
      setState(() {
        _searchResults = results.results ?? [];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Arama sırasında bir hata oluştu')),
      );
    }
  }

  void _onResultTap(Results result) {
    if (result.media_type == 'movie') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetail(movieId: result.id!),
        ),
      );
    } else if (result.media_type == 'tv') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TVDetail(tvId: result.id!)),
      );
    } else if (result.media_type == 'person') {
      print('Person tapped: ${result.name} (ID: ${result.id})');
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Film, dizi veya kişi ara...',
              hintStyle: TextStyle(color: Colors.grey[500]),
              prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey[500]),
                      onPressed: () {
                        _searchController.clear();
                        _performSearch('');
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
            onChanged: (value) {
              setState(() {});

              // Cancel previous timer
              _debounceTimer?.cancel();

              // Create new timer
              _debounceTimer = Timer(Duration(milliseconds: 300), () {
                if (value.length >= 2) {
                  _performSearch(value);
                } else if (value.isEmpty) {
                  _performSearch('');
                }
              });
            },
          ),
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomBarNavigation(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: Colors.red));
    }

    if (!_hasSearched) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 80, color: Colors.grey[700]),
            SizedBox(height: 16),
            Text(
              'Film, dizi veya kişi aramak için\nyukarıdaki arama çubuğunu kullanın',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ],
        ),
      );
    }

    if (_searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 80, color: Colors.grey[700]),
            SizedBox(height: 16),
            Text(
              'Sonuç bulunamadı',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Farklı bir arama deneyebilirsiniz',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final result = _searchResults[index];
        return _buildResultCard(result);
      },
    );
  }

  Widget _buildResultCard(Results result) {
    final String imageUrl = _getImageUrl(result);
    final String title = _getTitle(result);
    final String subtitle = _getSubtitle(result);
    final IconData typeIcon = _getTypeIcon(result);

    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () => _onResultTap(result),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 140,
          child: Row(
            children: [
              // Poster/Profile Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        width: 100,
                        height: 140,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildPlaceholder(typeIcon);
                        },
                      )
                    : _buildPlaceholder(typeIcon),
              ),
              // Content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Type badge
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _getTypeColor(result.media_type),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(typeIcon, size: 12, color: Colors.white),
                                SizedBox(width: 4),
                                Text(
                                  _getTypeLabel(result.media_type),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (result.vote_average != null &&
                              result.vote_average! > 0) ...[
                            SizedBox(width: 8),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 2),
                            Text(
                              result.vote_average!.toStringAsFixed(1),
                              style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 8),
                      // Title
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      // Subtitle
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[400], fontSize: 13),
                      ),
                      Spacer(),
                      // Overview preview
                      if (result.overview != null &&
                          result.overview!.isNotEmpty)
                        Text(
                          result.overview!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // Arrow icon
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.chevron_right, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(IconData icon) {
    return Container(
      width: 100,
      height: 140,
      color: Colors.grey[800],
      child: Icon(icon, size: 40, color: Colors.grey[600]),
    );
  }

  String _getImageUrl(Results result) {
    String? path;
    if (result.media_type == 'person') {
      path = result.profile_path;
    } else {
      path = result.poster_path;
    }
    return path != null ? 'https://image.tmdb.org/t/p/w200$path' : '';
  }

  String _getTitle(Results result) {
    if (result.media_type == 'person') {
      return result.name ?? 'İsimsiz';
    } else if (result.media_type == 'tv') {
      return result.name ?? result.original_name ?? 'İsimsiz';
    } else {
      return result.title ?? result.original_title ?? 'İsimsiz';
    }
  }

  String _getSubtitle(Results result) {
    if (result.media_type == 'person') {
      return result.known_for_department ?? 'Oyuncu';
    } else if (result.media_type == 'tv') {
      return result.release_date ?? 'TV Dizisi';
    } else {
      return result.release_date ?? 'Film';
    }
  }

  IconData _getTypeIcon(Results result) {
    switch (result.media_type) {
      case 'movie':
        return Icons.movie;
      case 'tv':
        return Icons.tv;
      case 'person':
        return Icons.person;
      default:
        return Icons.help_outline;
    }
  }

  String _getTypeLabel(String? mediaType) {
    switch (mediaType) {
      case 'movie':
        return 'FİLM';
      case 'tv':
        return 'DİZİ';
      case 'person':
        return 'KİŞİ';
      default:
        return 'DİĞER';
    }
  }

  Color _getTypeColor(String? mediaType) {
    switch (mediaType) {
      case 'movie':
        return Colors.red[700]!;
      case 'tv':
        return Colors.blue[700]!;
      case 'person':
        return Colors.purple[700]!;
      default:
        return Colors.grey[700]!;
    }
  }
}
