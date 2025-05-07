import 'package:filmstack/services/kofic_api_service.dart';
import 'package:flutter/material.dart';

class MovieRankingSection extends StatelessWidget {
  const MovieRankingSection({super.key});

  @override
  Widget build(BuildContext context) {
    var movie = KoficApiService().getDailyBoxOffice();

    print(movie);
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Text(
              '1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network('https://picsum.photos/250?image=9',
                  width: 80, height: 100, fit: BoxFit.cover),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text('승부',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
            Text('개봉일자: 2025 - 03 - 26',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Text(
              '누적관객수: 1,351,234',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '상영시간: 114분',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
