// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kofic_boxoffice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KoficBoxofficeDto _$KoficBoxofficeDtoFromJson(Map<String, dynamic> json) {
  return _KoficBoxofficeDto.fromJson(json);
}

/// @nodoc
mixin _$KoficBoxofficeDto {
  String get movieNm => throw _privateConstructorUsedError;
  String get rank => throw _privateConstructorUsedError;
  String get openDt => throw _privateConstructorUsedError;
  String get audiAcc => throw _privateConstructorUsedError;

  /// Serializes this KoficBoxofficeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KoficBoxofficeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KoficBoxofficeDtoCopyWith<KoficBoxofficeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KoficBoxofficeDtoCopyWith<$Res> {
  factory $KoficBoxofficeDtoCopyWith(
          KoficBoxofficeDto value, $Res Function(KoficBoxofficeDto) then) =
      _$KoficBoxofficeDtoCopyWithImpl<$Res, KoficBoxofficeDto>;
  @useResult
  $Res call({String movieNm, String rank, String openDt, String audiAcc});
}

/// @nodoc
class _$KoficBoxofficeDtoCopyWithImpl<$Res, $Val extends KoficBoxofficeDto>
    implements $KoficBoxofficeDtoCopyWith<$Res> {
  _$KoficBoxofficeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KoficBoxofficeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieNm = null,
    Object? rank = null,
    Object? openDt = null,
    Object? audiAcc = null,
  }) {
    return _then(_value.copyWith(
      movieNm: null == movieNm
          ? _value.movieNm
          : movieNm // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      openDt: null == openDt
          ? _value.openDt
          : openDt // ignore: cast_nullable_to_non_nullable
              as String,
      audiAcc: null == audiAcc
          ? _value.audiAcc
          : audiAcc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KoficBoxofficeDtoImplCopyWith<$Res>
    implements $KoficBoxofficeDtoCopyWith<$Res> {
  factory _$$KoficBoxofficeDtoImplCopyWith(_$KoficBoxofficeDtoImpl value,
          $Res Function(_$KoficBoxofficeDtoImpl) then) =
      __$$KoficBoxofficeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String movieNm, String rank, String openDt, String audiAcc});
}

/// @nodoc
class __$$KoficBoxofficeDtoImplCopyWithImpl<$Res>
    extends _$KoficBoxofficeDtoCopyWithImpl<$Res, _$KoficBoxofficeDtoImpl>
    implements _$$KoficBoxofficeDtoImplCopyWith<$Res> {
  __$$KoficBoxofficeDtoImplCopyWithImpl(_$KoficBoxofficeDtoImpl _value,
      $Res Function(_$KoficBoxofficeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of KoficBoxofficeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieNm = null,
    Object? rank = null,
    Object? openDt = null,
    Object? audiAcc = null,
  }) {
    return _then(_$KoficBoxofficeDtoImpl(
      movieNm: null == movieNm
          ? _value.movieNm
          : movieNm // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      openDt: null == openDt
          ? _value.openDt
          : openDt // ignore: cast_nullable_to_non_nullable
              as String,
      audiAcc: null == audiAcc
          ? _value.audiAcc
          : audiAcc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KoficBoxofficeDtoImpl implements _KoficBoxofficeDto {
  const _$KoficBoxofficeDtoImpl(
      {required this.movieNm,
      required this.rank,
      required this.openDt,
      required this.audiAcc});

  factory _$KoficBoxofficeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$KoficBoxofficeDtoImplFromJson(json);

  @override
  final String movieNm;
  @override
  final String rank;
  @override
  final String openDt;
  @override
  final String audiAcc;

  @override
  String toString() {
    return 'KoficBoxofficeDto(movieNm: $movieNm, rank: $rank, openDt: $openDt, audiAcc: $audiAcc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KoficBoxofficeDtoImpl &&
            (identical(other.movieNm, movieNm) || other.movieNm == movieNm) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.openDt, openDt) || other.openDt == openDt) &&
            (identical(other.audiAcc, audiAcc) || other.audiAcc == audiAcc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, movieNm, rank, openDt, audiAcc);

  /// Create a copy of KoficBoxofficeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KoficBoxofficeDtoImplCopyWith<_$KoficBoxofficeDtoImpl> get copyWith =>
      __$$KoficBoxofficeDtoImplCopyWithImpl<_$KoficBoxofficeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KoficBoxofficeDtoImplToJson(
      this,
    );
  }
}

abstract class _KoficBoxofficeDto implements KoficBoxofficeDto {
  const factory _KoficBoxofficeDto(
      {required final String movieNm,
      required final String rank,
      required final String openDt,
      required final String audiAcc}) = _$KoficBoxofficeDtoImpl;

  factory _KoficBoxofficeDto.fromJson(Map<String, dynamic> json) =
      _$KoficBoxofficeDtoImpl.fromJson;

  @override
  String get movieNm;
  @override
  String get rank;
  @override
  String get openDt;
  @override
  String get audiAcc;

  /// Create a copy of KoficBoxofficeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KoficBoxofficeDtoImplCopyWith<_$KoficBoxofficeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
