// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'generate_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenerateImageModel {
  bool get isLoading => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenerateImageModelCopyWith<GenerateImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateImageModelCopyWith<$Res> {
  factory $GenerateImageModelCopyWith(
          GenerateImageModel value, $Res Function(GenerateImageModel) then) =
      _$GenerateImageModelCopyWithImpl<$Res>;
  $Res call({bool isLoading, String image});
}

/// @nodoc
class _$GenerateImageModelCopyWithImpl<$Res>
    implements $GenerateImageModelCopyWith<$Res> {
  _$GenerateImageModelCopyWithImpl(this._value, this._then);

  final GenerateImageModel _value;
  // ignore: unused_field
  final $Res Function(GenerateImageModel) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_GenerateImageModelCopyWith<$Res>
    implements $GenerateImageModelCopyWith<$Res> {
  factory _$$_GenerateImageModelCopyWith(_$_GenerateImageModel value,
          $Res Function(_$_GenerateImageModel) then) =
      __$$_GenerateImageModelCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, String image});
}

/// @nodoc
class __$$_GenerateImageModelCopyWithImpl<$Res>
    extends _$GenerateImageModelCopyWithImpl<$Res>
    implements _$$_GenerateImageModelCopyWith<$Res> {
  __$$_GenerateImageModelCopyWithImpl(
      _$_GenerateImageModel _value, $Res Function(_$_GenerateImageModel) _then)
      : super(_value, (v) => _then(v as _$_GenerateImageModel));

  @override
  _$_GenerateImageModel get _value => super._value as _$_GenerateImageModel;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_GenerateImageModel(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GenerateImageModel implements _GenerateImageModel {
  const _$_GenerateImageModel({required this.isLoading, required this.image});

  @override
  final bool isLoading;
  @override
  final String image;

  @override
  String toString() {
    return 'GenerateImageModel(isLoading: $isLoading, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenerateImageModel &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_GenerateImageModelCopyWith<_$_GenerateImageModel> get copyWith =>
      __$$_GenerateImageModelCopyWithImpl<_$_GenerateImageModel>(
          this, _$identity);
}

abstract class _GenerateImageModel implements GenerateImageModel {
  const factory _GenerateImageModel(
      {required final bool isLoading,
      required final String image}) = _$_GenerateImageModel;

  @override
  bool get isLoading;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_GenerateImageModelCopyWith<_$_GenerateImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
