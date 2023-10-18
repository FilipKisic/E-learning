import 'package:flutter/material.dart';
import 'package:flutter_e_learning/presentation/screen/home_screen.dart';
import 'package:flutter_e_learning/presentation/screen/login_screen.dart';

class RouteGenerator {
  static const loginScreen = '/';
  static const homeScreen = '/home';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        throw Exception('Route not found...');
    }
  }
}
