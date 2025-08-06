import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _getCollection(String tipo) {
    return _db.collection(tipo);
  }

  Future<void> agregarNota(String tipo, String titulo, String contenido) {
    return _getCollection(tipo).add({'titulo': titulo, 'contenido': contenido});
  }

  Future<void> agregarEvento({
    required String titulo,
    required String descripcion,
    required String organizador,
    required String contacto,
    required String ciudad,
    required String ubicacionExacta,
    required String horaInicio,
    required String horaFin,
  }) async {
    await _db.collection('eventos').add({
      'titulo': titulo,
      'descripcion': descripcion,
      'organizador': organizador,
      'contacto': contacto,
      'ciudad': ciudad,
      'ubicacion': ubicacionExacta,
      'hora_inicio': horaInicio,
      'hora_fin': horaFin,
      'creado_en': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> leerNotas(String tipo) {
    return _getCollection(tipo).orderBy('titulo', descending: true).snapshots();
  }

  Future<void> actualizarNota(String tipo, String docId, String titulo, String contenido) {
    return _getCollection(tipo).doc(docId).update({
      'titulo': titulo,
      'contenido': contenido,
    });
  }

  Future<void> eliminarNota(String tipo, String id) {
    return _getCollection(tipo).doc(id).delete();
  }
}
