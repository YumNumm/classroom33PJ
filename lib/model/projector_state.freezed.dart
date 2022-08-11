// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'projector_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProjectorStateModel {
  int get projectorId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectorStateModelCopyWith<ProjectorStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectorStateModelCopyWith<$Res> {
  factory $ProjectorStateModelCopyWith(
          ProjectorStateModel value, $Res Function(ProjectorStateModel) then) =
      _$ProjectorStateModelCopyWithImpl<$Res>;
  $Res call({int projectorId});
}

/// @nodoc
class _$ProjectorStateModelCopyWithImpl<$Res>
    implements $ProjectorStateModelCopyWith<$Res> {
  _$ProjectorStateModelCopyWithImpl(this._value, this._then);

  final ProjectorStateModel _value;
  // ignore: unused_field
  final $Res Function(ProjectorStateModel) _then;

  @override
  $Res call({
    Object? projectorId = freezed,
  }) {
    return _then(_value.copyWith(
      projectorId: projectorId == freezed
          ? _value.projectorId
          : projectorId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ProjectorStateModelCopyWith<$Res>
    implements $ProjectorStateModelCopyWith<$Res> {
  factory _$$_ProjectorStateModelCopyWith(_$_ProjectorStateModel value,
          $Res Function(_$_ProjectorStateModel) then) =
      __$$_ProjectorStateModelCopyWithImpl<$Res>;
  @override
  $Res call({int projectorId});
}

/// @nodoc
class __$$_ProjectorStateModelCopyWithImpl<$Res>
    extends _$ProjectorStateModelCopyWithImpl<$Res>
    implements _$$_ProjectorStateModelCopyWith<$Res> {
  __$$_ProjectorStateModelCopyWithImpl(_$_ProjectorStateModel _value,
      $Res Function(_$_ProjectorStateModel) _then)
      : super(_value, (v) => _then(v as _$_ProjectorStateModel));

  @override
  _$_ProjectorStateModel get _value => super._value as _$_ProjectorStateModel;

  @override
  $Res call({
    Object? projectorId = freezed,
  }) {
    return _then(_$_ProjectorStateModel(
      projectorId: projectorId == freezed
          ? _value.projectorId
          : projectorId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProjectorStateModel extends _ProjectorStateModel {
  _$_ProjectorStateModel({required this.projectorId}) : super._();

  @override
  final int projectorId;

  @override
  String toString() {
    return 'ProjectorStateModel(projectorId: $projectorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectorStateModel &&
            const DeepCollectionEquality()
                .equals(other.projectorId, projectorId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(projectorId));

  @JsonKey(ignore: true)
  @override
  _$$_ProjectorStateModelCopyWith<_$_ProjectorStateModel> get copyWith =>
      __$$_ProjectorStateModelCopyWithImpl<_$_ProjectorStateModel>(
          this, _$identity);
}

abstract class _ProjectorStateModel extends ProjectorStateModel {
  factory _ProjectorStateModel({required final int projectorId}) =
      _$_ProjectorStateModel;
  _ProjectorStateModel._() : super._();

  @override
  int get projectorId;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectorStateModelCopyWith<_$_ProjectorStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
