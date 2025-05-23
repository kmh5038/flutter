import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:filmstack/dto/kofic_boxoffice_dto.dart';

class KoficApiService {
  static const String _baseUrl = 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?';
  final String _apiKey = dotenv.get('koficApiKey');

  Future<List<KoficBoxofficeDto>> getDailyBoxOffice() async {
    try {
      // 현재 날짜를 YYYYMMDD 형식으로 변환
      final now = DateTime.now();
      // padLeft(2, '0') -> 최종 길이 2로 만들어라, 1자리면 0 채워서 2자리 만든다.
      final targetDate = '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';

      final response = await http.get(
        Uri.parse('$_baseUrl'
            'key=$_apiKey'
            '&targetDt=$targetDate'
        ),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final boxOfficeList = jsonData['boxOfficeResult']['dailyBoxOfficeList'] as List;
        
        return boxOfficeList
            .map((json) => KoficBoxofficeDto.fromJson(json))
            .toList(); // 리스트로 변환(원래 Iterable타입임)
      } else {
        throw Exception('Failed to load box office data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching box office data: $e');
    }
  }
} 