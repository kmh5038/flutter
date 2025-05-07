import 'package:freezed_annotation/freezed_annotation.dart';

part 'tmdb_movie_dto.freezed.dart';
part 'tmdb_movie_dto.g.dart';

@freezed
class TmdbMovieDto with _$TmdbMovieDto {
  const factory TmdbMovieDto({
    required String posterPath,
    required int runtime,
  }) = _TmdbMovieDto;

  factory TmdbMovieDto.fromJson(Map<String, dynamic> json) =>
      _$TmdbMovieDtoFromJson(json);
}
