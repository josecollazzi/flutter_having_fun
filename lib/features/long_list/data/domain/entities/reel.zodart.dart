// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel.dart';

// **************************************************************************
// ZodArtGenerator
// **************************************************************************

/// Inferred Dart type returned from the schema defined in [ReelSchema].
///
/// This corresponds to the structure described by [ReelSchema.schema].
typedef _ReelSchemaDef = ({
  ZString description,
  ZString id,
  ZString imageId,
  ZString title,
});

/// Enum for fields declared in [ReelSchema].
///
/// Values mirror the keys of [ReelSchema.schema].
enum ReelSchemaProps { description, id, imageId, title }

/// Helper class for [ReelSchema].
///
/// Wrapper used to access [ReelSchemaProps] values as getters.
final class _ReelSchemaPropsWrapper {
  const _ReelSchemaPropsWrapper();

  ReelSchemaProps get description => ReelSchemaProps.description;

  ReelSchemaProps get id => ReelSchemaProps.id;

  ReelSchemaProps get imageId => ReelSchemaProps.imageId;

  ReelSchemaProps get title => ReelSchemaProps.title;
}

/// Mixin used as interface for [Reel].
///
/// Providing getters and overriding methods.
mixin _ReelSchema {
  String get description;
  String get id;
  String get imageId;
  String get title;
  @override
  int get hashCode => Object.hash(runtimeType, description, id, imageId, title);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            other is Reel &&
            (identical(description, other.description) ||
                description == other.description) &&
            (identical(id, other.id) || id == other.id) &&
            (identical(imageId, other.imageId) || imageId == other.imageId) &&
            (identical(title, other.title) || title == other.title));
  }

  @override
  String toString() {
    return 'Reel(description: $description, id: $id, imageId: $imageId, title: $title)';
  }
}

/// Class used as implementation for [Reel] and [_ReelSchema].
///
/// Providing fields and a default constructor.
final class _ReelSchemaImpl with _ReelSchema implements Reel {
  const _ReelSchemaImpl({
    required this.description,
    required this.id,
    required this.imageId,
    required this.title,
  });

  @override
  final String description;

  @override
  final String id;

  @override
  final String imageId;

  @override
  final String title;
}

/// Instantiates the output class [Reel] using [_ReelSchemaImpl].
Reel _instantiateReelSchema({
  required String description,
  required String id,
  required String imageId,
  required String title,
}) => _ReelSchemaImpl(
  description: description,
  id: id,
  imageId: imageId,
  title: title,
);

/// Generated utility class for working with the schema defined in [ReelSchema].
///
/// Provides:
/// - The `ZObject` instance for parsing/validating the schema.
/// - Enum-style access to the schema properties.
/// - Strongly-typed field access
/// - Runtime `Type` of the schema record
final class _ReelSchemaUtils
    implements ZGenSchemaUtils<_ReelSchemaPropsWrapper, Reel> {
  const _ReelSchemaUtils();

  static const _props = _ReelSchemaPropsWrapper();

  static const _keys = ['description', 'id', 'imageId', 'title'];

  static final Map<String, ZBase<dynamic>> _schemaMap = {
    'description': ReelSchema.schema.description,
    'id': ReelSchema.schema.id,
    'imageId': ReelSchema.schema.imageId,
    'title': ReelSchema.schema.title,
  };

  @override
  _ReelSchemaPropsWrapper get props => _props;

  @override
  List<String> get keys => _keys;

  @override
  ZObject<Reel> get zObject {
    return ZObject.withMapper(_schemaMap, fromJson: _toResult);
  }

  @override
  Type get schema => _ReelSchemaDef;

  Reel _toResult(Map<String, dynamic> val) => _instantiateReelSchema(
    description: val['description'] as String,
    id: val['id'] as String,
    imageId: val['imageId'] as String,
    title: val['title'] as String,
  );
}
