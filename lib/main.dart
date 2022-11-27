
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/server_locator.dart';


import 'movies/presentation/screen/movies_screen.dart';

void main() {
  ServerLocator().setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.grey.shade900
      ),
      home: const MoviesScreen(),
    );
  }




}