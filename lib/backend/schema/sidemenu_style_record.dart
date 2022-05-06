import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sidemenu_style_record.g.dart';

abstract class SidemenuStyleRecord
    implements Built<SidemenuStyleRecord, SidemenuStyleRecordBuilder> {
  static Serializer<SidemenuStyleRecord> get serializer =>
      _$sidemenuStyleRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'background_colour')
  String get backgroundColour;

  @nullable
  @BuiltValueField(wireName: 'hover_colour')
  String get hoverColour;

  @nullable
  @BuiltValueField(wireName: 'selected_colour')
  String get selectedColour;

  @nullable
  @BuiltValueField(wireName: 'text_colour')
  String get textColour;

  @nullable
  @BuiltValueField(wireName: 'icon_colour')
  String get iconColour;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SidemenuStyleRecordBuilder builder) => builder
    ..backgroundColour = ''
    ..hoverColour = ''
    ..selectedColour = ''
    ..textColour = ''
    ..iconColour = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sidemenu_style');

  static Stream<SidemenuStyleRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SidemenuStyleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SidemenuStyleRecord._();
  factory SidemenuStyleRecord(
          [void Function(SidemenuStyleRecordBuilder) updates]) =
      _$SidemenuStyleRecord;

  static SidemenuStyleRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSidemenuStyleRecordData({
  String backgroundColour,
  String hoverColour,
  String selectedColour,
  String textColour,
  String iconColour,
}) =>
    serializers.toFirestore(
        SidemenuStyleRecord.serializer,
        SidemenuStyleRecord((s) => s
          ..backgroundColour = backgroundColour
          ..hoverColour = hoverColour
          ..selectedColour = selectedColour
          ..textColour = textColour
          ..iconColour = iconColour));
