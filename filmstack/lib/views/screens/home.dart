import 'package:flutter/material.dart';
import 'package:filmstack/utils/words.dart';
import 'package:filmstack/views/wigets/movie_ranking_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff101010),
        title: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              Words.homeTitle,
              style: TextStyle(color: Colors.white),
            )),
      ),
      backgroundColor: Color(0xff101010),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: MovieRankingSection(),
          )
        ],
      ),
    );
  }
}
