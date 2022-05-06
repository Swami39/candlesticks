import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'radarchart_record.g.dart';

abstract class RadarchartRecord
    implements Built<RadarchartRecord, RadarchartRecordBuilder> {
  static Serializer<RadarchartRecord> get serializer =>
      _$radarchartRecordSerializer;

  @nullable
  BuiltList<int> get data1;

  @nullable
  BuiltList<int> get data2;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RadarchartRecordBuilder builder) => builder
    ..data1 = ListBuilder()
    ..data2 = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('radarchart');

  static Stream<RadarchartRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RadarchartRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  RadarchartRecord._();
  factory RadarchartRecord([void Function(RadarchartRecordBuilder) updates]) =
      _$RadarchartRecord;

  static RadarchartRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRadarchartRecordData() => serializers.toFirestore(
    RadarchartRecord.serializer,
    RadarchartRecord((r) => r
      ..data1 = null
      ..data2 = null));
