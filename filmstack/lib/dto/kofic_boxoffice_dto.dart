class KoficBoxofficeDto {
  final String movieNm;
  final String rank;
  final String openDt;
  final String audiAcc;

  KoficBoxofficeDto({
    required this.movieNm,
    required this.rank,
    required this.openDt,
    required this.audiAcc,
  });

  KoficBoxofficeDto.fromJson(Map<String, dynamic> json)
  : movieNm = json['movieNm'],
    rank = json['rank'],
    openDt = json['openDt'],
    audiAcc = json['audiAcc'];
}