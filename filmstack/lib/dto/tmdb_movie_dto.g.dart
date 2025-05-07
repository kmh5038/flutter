// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TmdbMovieDtoImpl _$$TmdbMovieDtoImplFromJson(Map<String, dynamic> json) =>
    _$TmdbMovieDtoImpl(
      posterPath: json['posterPath'] as String,
      runtime: (json['runtime'] as num).toInt(),
    );

Map<String, dynamic> _$$TmdbMovieDtoImplToJson(_$TmdbMovieDtoImpl instance) =>
    <String, dynamic>{
      'posterPath': instance.posterPath,
      'runtime': instance.runtime,
    };
