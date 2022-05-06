import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'candlesticks_record.g.dart';

abstract class CandlesticksRecord
    implements Built<CandlesticksRecord, CandlesticksRecordBuilder> {
  static Serializer<CandlesticksRecord> get serializer =>
      _$candlesticksRecordSerializer;

  @nullable
  String get symbol;

  @nullable
  String get interval;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CandlesticksRecordBuilder builder) => builder
    ..symbol = ''
    ..interval = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('candlesticks');

  static Stream<CandlesticksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CandlesticksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CandlesticksRecord._();
  factory CandlesticksRecord(
          [void Function(CandlesticksRecordBuilder) updates]) =
      _$CandlesticksRecord;

  static CandlesticksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCandlesticksRecordData({
  String symbol,
  String interval,
}) =>
    serializers.toFirestore(
        CandlesticksRecord.serializer,
        CandlesticksRecord((c) => c
          ..symbol = symbol
          ..interval = interval));
