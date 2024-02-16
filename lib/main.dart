import 'package:flutter/material.dart';
import 'package:movie_app/data/providers/movie_provider.dart';
import 'package:movie_app/data/repositories/dio_settings.dart';
import 'package:movie_app/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(
        dio: DioSettings().dio,
      ),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
