// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tmdb_movie_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TmdbMovieDto _$TmdbMovieDtoFromJson(Map<String, dynamic> json) {
  return _TmdbMovieDto.fromJson(json);
}

/// @nodoc
mixin _$TmdbMovieDto {
  String get posterPath => throw _privateConstructorUsedError;
  int get runtime => throw _privateConstructorUsedError;

  /// Serializes this TmdbMovieDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TmdbMovieDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TmdbMovieDtoCopyWith<TmdbMovieDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TmdbMovieDtoCopyWith<$Res> {
  factory $TmdbMovieDtoCopyWith(
          TmdbMovieDto value, $Res Function(TmdbMovieDto) then) =
      _$TmdbMovieDtoCopyWithImpl<$Res, TmdbMovieDto>;
  @useResult
  $Res call({String posterPath, int runtime});
}

/// @nodoc
class _$TmdbMovieDtoCopyWithImpl<$Res, $Val extends TmdbMovieDto>
    implements $TmdbMovieDtoCopyWith<$Res> {
  _$TmdbMovieDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TmdbMovieDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = null,
    Object? runtime = null,
  }) {
    return _then(_value.copyWith(
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TmdbMovieDtoImplCopyWith<$Res>
    implements $TmdbMovieDtoCopyWith<$Res> {
  factory _$$TmdbMovieDtoImplCopyWith(
          _$TmdbMovieDtoImpl value, $Res Function(_$TmdbMovieDtoImpl) then) =
      __$$TmdbMovieDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String posterPath, int runtime});
}

/// @nodoc
class __$$TmdbMovieDtoImplCopyWithImpl<$Res>
    extends _$TmdbMovieDtoCopyWithImpl<$Res, _$TmdbMovieDtoImpl>
    implements _$$TmdbMovieDtoImplCopyWith<$Res> {
  __$$TmdbMovieDtoImplCopyWithImpl(
      _$TmdbMovieDtoImpl _value, $Res Function(_$TmdbMovieDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TmdbMovieDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterPath = null,
    Object? runtime = null,
  }) {
    return _then(_$TmdbMovieDtoImpl(
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TmdbMovieDtoImpl implements _TmdbMovieDto {
  const _$TmdbMovieDtoImpl({required this.posterPath, required this.runtime});

  factory _$TmdbMovieDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TmdbMovieDtoImplFromJson(json);

  @override
  final String posterPath;
  @override
  final int runtime;

  @override
  String toString() {
    return 'TmdbMovieDto(posterPath: $posterPath, runtime: $runtime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TmdbMovieDtoImpl &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.runtime, runtime) || other.runtime == runtime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, posterPath, runtime);

  /// Create a copy of TmdbMovieDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TmdbMovieDtoImplCopyWith<_$TmdbMovieDtoImpl> get copyWith =>
      __$$TmdbMovieDtoImplCopyWithImpl<_$TmdbMovieDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TmdbMovieDtoImplToJson(
      this,
    );
  }
}

abstract class _TmdbMovieDto implements TmdbMovieDto {
  const factory _TmdbMovieDto(
      {required final String posterPath,
      required final int runtime}) = _$TmdbMovieDtoImpl;

  factory _TmdbMovieDto.fromJson(Map<String, dynamic> json) =
      _$TmdbMovieDtoImpl.fromJson;

  @override
  String get posterPath;
  @override
  int get runtime;

  /// Create a copy of TmdbMovieDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TmdbMovieDtoImplCopyWith<_$TmdbMovieDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
