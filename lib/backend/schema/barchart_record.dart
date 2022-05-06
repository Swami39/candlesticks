import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'barchart_record.g.dart';

abstract class BarchartRecord
    implements Built<BarchartRecord, BarchartRecordBuilder> {
  static Serializer<BarchartRecord> get serializer =>
      _$barchartRecordSerializer;

  @nullable
  String get name;

  @nullable
  int get xaxis;

  @nullable
  int get yaxis;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BarchartRecordBuilder builder) => builder
    ..name = ''
    ..xaxis = 0
    ..yaxis = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('barchart');

  static Stream<BarchartRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BarchartRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BarchartRecord._();
  factory BarchartRecord([void Function(BarchartRecordBuilder) updates]) =
      _$BarchartRecord;

  static BarchartRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBarchartRecordData({
  String name,
  int xaxis,
  int yaxis,
}) =>
    serializers.toFirestore(
        BarchartRecord.serializer,
        BarchartRecord((b) => b
          ..name = name
          ..xaxis = xaxis
          ..yaxis = yaxis));
