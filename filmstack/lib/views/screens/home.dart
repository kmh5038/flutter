import 'package:flutter/material.dart';
import 'package:filmstack/utils/words.dart';
import 'package:filmstack/views/wigets/movie_ranking_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(Words.homeTitle),
      ),
      body: Column(
        children: [
          MovieRankingSection()
        ],
      ),
    );
  }
}
