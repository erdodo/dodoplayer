import 'package:dodoplayer/HomePage.dart';
import 'package:dodoplayer/pages/sign/LoginPage.dart';
import 'package:dodoplayer/providers/GlobalProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      // Eğer kullanıcı giriş yapmışsa favorileri yükle
      if (isLoggedIn && mounted) {
        final username = prefs.getString('username');
        if (username != null && username.isNotEmpty) {
          final favoritesProvider = Provider.of<GlobalProvider>(
            context,
            listen: false,
          );
          await favoritesProvider.loadFavorites(username);
          print('Favoriler otomatik yüklendi');
        }
      }

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
        body: Center(child: CircularProgressIndicator(color: Colors.red)),
      );
    }

    return _isLoggedIn
        ? const MyHomePage(title: 'ErdoFlix')
        : const LoginPage();
  }
}
