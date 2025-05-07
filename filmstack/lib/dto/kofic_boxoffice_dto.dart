import 'package:freezed_annotation/freezed_annotation.dart';

part 'kofic_boxoffice_dto.freezed.dart';
part 'kofic_boxoffice_dto.g.dart';

@freezed
class KoficBoxofficeDto with _$KoficBoxofficeDto {
  const factory KoficBoxofficeDto(
      {required String movieNm,
      required String rank,
      required String openDt,
      required String audiAcc}) = _KoficBoxofficeDto;

  factory KoficBoxofficeDto.fromJson(Map<String, dynamic> json) =>
      _$KoficBoxofficeDtoFromJson(json);
}
