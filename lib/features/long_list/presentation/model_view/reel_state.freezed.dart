// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReelState {

 ReelStatus get status; List<Reel> get reels; dynamic get currentPointer; dynamic get lastPointer; bool get hasReachedMax;
/// Create a copy of ReelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReelStateCopyWith<ReelState> get copyWith => _$ReelStateCopyWithImpl<ReelState>(this as ReelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReelState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.reels, reels)&&const DeepCollectionEquality().equals(other.currentPointer, currentPointer)&&const DeepCollectionEquality().equals(other.lastPointer, lastPointer)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(reels),const DeepCollectionEquality().hash(currentPointer),const DeepCollectionEquality().hash(lastPointer),hasReachedMax);

@override
String toString() {
  return 'ReelState(status: $status, reels: $reels, currentPointer: $currentPointer, lastPointer: $lastPointer, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class $ReelStateCopyWith<$Res>  {
  factory $ReelStateCopyWith(ReelState value, $Res Function(ReelState) _then) = _$ReelStateCopyWithImpl;
@useResult
$Res call({
 ReelStatus status, List<Reel> reels, dynamic currentPointer, dynamic lastPointer, bool hasReachedMax
});




}
/// @nodoc
class _$ReelStateCopyWithImpl<$Res>
    implements $ReelStateCopyWith<$Res> {
  _$ReelStateCopyWithImpl(this._self, this._then);

  final ReelState _self;
  final $Res Function(ReelState) _then;

/// Create a copy of ReelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? reels = null,Object? currentPointer = freezed,Object? lastPointer = freezed,Object? hasReachedMax = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReelStatus,reels: null == reels ? _self.reels : reels // ignore: cast_nullable_to_non_nullable
as List<Reel>,currentPointer: freezed == currentPointer ? _self.currentPointer : currentPointer // ignore: cast_nullable_to_non_nullable
as dynamic,lastPointer: freezed == lastPointer ? _self.lastPointer : lastPointer // ignore: cast_nullable_to_non_nullable
as dynamic,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReelState].
extension ReelStatePatterns on ReelState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReelState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReelState value)  $default,){
final _that = this;
switch (_that) {
case _ReelState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReelState value)?  $default,){
final _that = this;
switch (_that) {
case _ReelState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReelStatus status,  List<Reel> reels,  dynamic currentPointer,  dynamic lastPointer,  bool hasReachedMax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReelState() when $default != null:
return $default(_that.status,_that.reels,_that.currentPointer,_that.lastPointer,_that.hasReachedMax);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReelStatus status,  List<Reel> reels,  dynamic currentPointer,  dynamic lastPointer,  bool hasReachedMax)  $default,) {final _that = this;
switch (_that) {
case _ReelState():
return $default(_that.status,_that.reels,_that.currentPointer,_that.lastPointer,_that.hasReachedMax);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReelStatus status,  List<Reel> reels,  dynamic currentPointer,  dynamic lastPointer,  bool hasReachedMax)?  $default,) {final _that = this;
switch (_that) {
case _ReelState() when $default != null:
return $default(_that.status,_that.reels,_that.currentPointer,_that.lastPointer,_that.hasReachedMax);case _:
  return null;

}
}

}

/// @nodoc


class _ReelState implements ReelState {
  const _ReelState({required this.status, required final  List<Reel> reels, required this.currentPointer, required this.lastPointer, required this.hasReachedMax}): _reels = reels;
  

@override final  ReelStatus status;
 final  List<Reel> _reels;
@override List<Reel> get reels {
  if (_reels is EqualUnmodifiableListView) return _reels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reels);
}

@override final  dynamic currentPointer;
@override final  dynamic lastPointer;
@override final  bool hasReachedMax;

/// Create a copy of ReelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReelStateCopyWith<_ReelState> get copyWith => __$ReelStateCopyWithImpl<_ReelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReelState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._reels, _reels)&&const DeepCollectionEquality().equals(other.currentPointer, currentPointer)&&const DeepCollectionEquality().equals(other.lastPointer, lastPointer)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_reels),const DeepCollectionEquality().hash(currentPointer),const DeepCollectionEquality().hash(lastPointer),hasReachedMax);

@override
String toString() {
  return 'ReelState(status: $status, reels: $reels, currentPointer: $currentPointer, lastPointer: $lastPointer, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class _$ReelStateCopyWith<$Res> implements $ReelStateCopyWith<$Res> {
  factory _$ReelStateCopyWith(_ReelState value, $Res Function(_ReelState) _then) = __$ReelStateCopyWithImpl;
@override @useResult
$Res call({
 ReelStatus status, List<Reel> reels, dynamic currentPointer, dynamic lastPointer, bool hasReachedMax
});




}
/// @nodoc
class __$ReelStateCopyWithImpl<$Res>
    implements _$ReelStateCopyWith<$Res> {
  __$ReelStateCopyWithImpl(this._self, this._then);

  final _ReelState _self;
  final $Res Function(_ReelState) _then;

/// Create a copy of ReelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? reels = null,Object? currentPointer = freezed,Object? lastPointer = freezed,Object? hasReachedMax = null,}) {
  return _then(_ReelState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReelStatus,reels: null == reels ? _self._reels : reels // ignore: cast_nullable_to_non_nullable
as List<Reel>,currentPointer: freezed == currentPointer ? _self.currentPointer : currentPointer // ignore: cast_nullable_to_non_nullable
as dynamic,lastPointer: freezed == lastPointer ? _self.lastPointer : lastPointer // ignore: cast_nullable_to_non_nullable
as dynamic,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
