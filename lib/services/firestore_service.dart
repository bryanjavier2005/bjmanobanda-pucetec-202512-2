import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference eventos =
      FirebaseFirestore.instance.collection('eventos');

  Future<void> agregarEvento({
    required String titulo,
    required String descripcion,
    required String organizador,
    required String contacto,
    required String ciudad,
    required String ubicacionExacta,
    required String fecha,
    required String horaInicio,
    required String horaFin,
  }) async {
    await eventos.add({
      'titulo': titulo,
      'descripcion': descripcion,
      'organizador': organizador,
      'contacto': contacto,
      'ciudad': ciudad,
      'ubicacionExacta': ubicacionExacta,
      'fecha': fecha,
      'horaInicio': horaInicio,
      'horaFin': horaFin,
      'creado_en': FieldValue.serverTimestamp(),
    });
  }

  Future<void> actualizarEvento({
    required String id,
    required String titulo,
    required String descripcion,
    required String organizador,
    required String contacto,
    required String ciudad,
    required String ubicacionExacta,
    required String fecha,
    required String horaInicio,
    required String horaFin,
  }) async {
    await eventos.doc(id).update({
      'titulo': titulo,
      'descripcion': descripcion,
      'organizador': organizador,
      'contacto': contacto,
      'ciudad': ciudad,
      'ubicacionExacta': ubicacionExacta,
      'fecha': fecha,
      'horaInicio': horaInicio,
      'horaFin': horaFin,
    });
  }

  Future<void> eliminarEvento(String id) async {
    await eventos.doc(id).delete();
  }
}
