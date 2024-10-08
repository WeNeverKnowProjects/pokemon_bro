import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreService {
  Future<void> setData(
      {required String path, required Map<String, dynamic> body});
  Future<List<T>> getCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String docId) builder,
    Query Function(Query query)? queryBuilder,
  });
  Future<T?> getDocument<T>({
    required String collectionPath,
    required String id,
    required T? Function(Map<String, dynamic>? data, String docId) builder,
  });
  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String docId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  });

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String docId) builder,
  });
  Future<void> delete(String path, String id);

  CollectionReference<Map<String, dynamic>> collectionReference(String path);

  DocumentReference<Map<String, dynamic>> getDocReference(
      String documentReference);
}

@Singleton(as: FirestoreService)
class FirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore firebaseFirestore;
  FirestoreServiceImpl(this.firebaseFirestore);
  @override
  Stream<List<T>> collectionStream<T>(
      {required String path,
      required T Function(Map<String, dynamic> data, String docId) builder,
      Query<Object?> Function(Query<Object?> query)? queryBuilder,
      int Function(T lhs, T rhs)? sort}) {
    Query query = firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((doc) => builder(doc.data() as Map<String, dynamic>, doc.id))
          .where((element) => element != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  @override
  Stream<T> documentStream<T>(
      {required String path,
      required T Function(Map<String, dynamic> data, String docId) builder}) {
    final reference = firebaseFirestore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map(
        (event) => builder(event.data() as Map<String, dynamic>, event.id));
  }

  @override
  Future<List<T>> getCollection<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String docId) builder,
    Query Function(Query query)? queryBuilder,
  }) {
    Query query = firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    // return snapshots.map((snapshot) {
    //   final result = snapshot.docs.map((doc) => builder(doc.data() as Map<String, dynamic>, doc.id))
    //   .where((element) => element!=null).toList()
    //   return result;
    // });
    return query.get().then((value) => value.docs
        .map((e) => builder(e.data() as Map<String, dynamic>, e.id))
        .toList());
  }

  @override
  Future<T?> getDocument<T>({
    required String collectionPath,
    required String id,
    required T? Function(Map<String, dynamic>? data, String docId) builder,
  }) async {
    var collection = firebaseFirestore.collection(collectionPath);
    var document = await collection.doc(id).get();
    return builder(document.data(), document.id);
  }

  @override
  Future<void> setData(
      {required String path, required Map<String, dynamic> body}) async {
    final reference = firebaseFirestore.doc(path);
    await reference.set(body);
  }

  @override
  Future<void> delete(String path, String id) async {
    return await firebaseFirestore.collection(path).doc(id).delete();
  }

  @override
  CollectionReference<Map<String, dynamic>> collectionReference(String path) {
    return firebaseFirestore.collection(path);
  }

  @override
  DocumentReference<Map<String, dynamic>> getDocReference(
          String documentReference) =>
      firebaseFirestore.doc(documentReference);
}
