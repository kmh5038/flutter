// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kofic_boxoffice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KoficBoxofficeDtoImpl _$$KoficBoxofficeDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$KoficBoxofficeDtoImpl(
      movieNm: json['movieNm'] as String,
      rank: json['rank'] as String,
      openDt: json['openDt'] as String,
      audiAcc: json['audiAcc'] as String,
    );

Map<String, dynamic> _$$KoficBoxofficeDtoImplToJson(
        _$KoficBoxofficeDtoImpl instance) =>
    <String, dynamic>{
      'movieNm': instance.movieNm,
      'rank': instance.rank,
      'openDt': instance.openDt,
      'audiAcc': instance.audiAcc,
    };
