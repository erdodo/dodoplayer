import 'package:dodoplayer/providers/GlobalProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarNavigation extends StatefulWidget {
  const BottomBarNavigation({super.key});

  @override
  State<BottomBarNavigation> createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    final globalProvider = Provider.of<GlobalProvider>(context, listen: false);
    _currentIndex = globalProvider.activePageIndex;
  }

  void _onItemTapped(int index) {
    // Önce provider'ı güncelleyin
    final globalProvider = Provider.of<GlobalProvider>(context, listen: false);
    globalProvider.setActivePageIndex(index);
    // Sonra navigasyon yapın
    if (index == 0) {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } else if (index == 1) {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil('/favorites', (route) => false);
    } else if (index == 2) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/search', (route) => false);

    } else if (index == 3) {
      // Profil sayfasına yönlendirme
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 13,
        unselectedFontSize: 11,
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedIconTheme: const IconThemeData(size: 24),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favoriler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Ara',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
