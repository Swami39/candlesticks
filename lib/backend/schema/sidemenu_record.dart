import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sidemenu_record.g.dart';

abstract class SidemenuRecord
    implements Built<SidemenuRecord, SidemenuRecordBuilder> {
  static Serializer<SidemenuRecord> get serializer =>
      _$sidemenuRecordSerializer;

  @nullable
  String get title;

  @nullable
  int get priority;

  @nullable
  String get icon;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SidemenuRecordBuilder builder) => builder
    ..title = ''
    ..priority = 0
    ..icon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sidemenu');

  static Stream<SidemenuRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SidemenuRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SidemenuRecord._();
  factory SidemenuRecord([void Function(SidemenuRecordBuilder) updates]) =
      _$SidemenuRecord;

  static SidemenuRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSidemenuRecordData({
  String title,
  int priority,
  String icon,
}) =>
    serializers.toFirestore(
        SidemenuRecord.serializer,
        SidemenuRecord((s) => s
          ..title = title
          ..priority = priority
          ..icon = icon));
