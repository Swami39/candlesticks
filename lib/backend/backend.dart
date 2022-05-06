import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/sidemenu_record.dart';
import 'schema/users_record.dart';
import 'schema/sidemenu_style_record.dart';
import 'schema/barchart_record.dart';
import 'schema/scatterchart_record.dart';
import 'schema/candlesticks_record.dart';
import 'schema/radarchart_record.dart';
import 'schema/serializers.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/sidemenu_record.dart';
export 'schema/users_record.dart';
export 'schema/sidemenu_style_record.dart';
export 'schema/barchart_record.dart';
export 'schema/scatterchart_record.dart';
export 'schema/candlesticks_record.dart';
export 'schema/radarchart_record.dart';

/// Functions to query SidemenuRecords (as a Stream and as a Future).
Stream<List<SidemenuRecord>> querySidemenuRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(SidemenuRecord.collection, SidemenuRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<SidemenuRecord>> querySidemenuRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(SidemenuRecord.collection, SidemenuRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<SidemenuRecord>> querySidemenuRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      SidemenuRecord.collection,
      SidemenuRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query UsersRecords (as a Stream and as a Future).
Stream<List<UsersRecord>> queryUsersRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<UsersRecord>> queryUsersRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<UsersRecord>> queryUsersRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      UsersRecord.collection,
      UsersRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query SidemenuStyleRecords (as a Stream and as a Future).
Stream<List<SidemenuStyleRecord>> querySidemenuStyleRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        SidemenuStyleRecord.collection, SidemenuStyleRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<SidemenuStyleRecord>> querySidemenuStyleRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        SidemenuStyleRecord.collection, SidemenuStyleRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<SidemenuStyleRecord>> querySidemenuStyleRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      SidemenuStyleRecord.collection,
      SidemenuStyleRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query BarchartRecords (as a Stream and as a Future).
Stream<List<BarchartRecord>> queryBarchartRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(BarchartRecord.collection, BarchartRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<BarchartRecord>> queryBarchartRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(BarchartRecord.collection, BarchartRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<BarchartRecord>> queryBarchartRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      BarchartRecord.collection,
      BarchartRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query ScatterchartRecords (as a Stream and as a Future).
Stream<List<ScatterchartRecord>> queryScatterchartRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        ScatterchartRecord.collection, ScatterchartRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ScatterchartRecord>> queryScatterchartRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        ScatterchartRecord.collection, ScatterchartRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<ScatterchartRecord>> queryScatterchartRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      ScatterchartRecord.collection,
      ScatterchartRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query CandlesticksRecords (as a Stream and as a Future).
Stream<List<CandlesticksRecord>> queryCandlesticksRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        CandlesticksRecord.collection, CandlesticksRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<CandlesticksRecord>> queryCandlesticksRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        CandlesticksRecord.collection, CandlesticksRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<CandlesticksRecord>> queryCandlesticksRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      CandlesticksRecord.collection,
      CandlesticksRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query RadarchartRecords (as a Stream and as a Future).
Stream<List<RadarchartRecord>> queryRadarchartRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(RadarchartRecord.collection, RadarchartRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<RadarchartRecord>> queryRadarchartRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        RadarchartRecord.collection, RadarchartRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<RadarchartRecord>> queryRadarchartRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      RadarchartRecord.collection,
      RadarchartRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

Stream<List<T>> queryCollection<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>> dataStream;
  final QueryDocumentSnapshot nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  CollectionReference collection,
  Serializer<T> serializer, {
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot> docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore record representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    return;
  }

  final userData = createUsersRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
}
