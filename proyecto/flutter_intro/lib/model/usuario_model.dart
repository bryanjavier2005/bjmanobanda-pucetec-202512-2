import 'dart:convert';

class UsuarioModel {
    final int? id;
    final String? nombresApellidos;
    final String? correo;
    final String? cedula;
    final String? telefono;
    final String? descripcion;
    final bool? estado;
    final DateTime? creacion;
    final DateTime? actualizacion;

    UsuarioModel({
        this.id,
        this.nombresApellidos,
        this.correo,
        this.cedula,
        this.telefono,
        this.descripcion,
        this.estado,
        this.creacion,
        this.actualizacion,
    });

    UsuarioModel copyWith({
        int? id,
        String? nombresApellidos,
        String? correo,
        String? cedula,
        String? telefono,
        String? descripcion,
        bool? estado,
        DateTime? creacion,
        DateTime? actualizacion,
    }) => 
        UsuarioModel(
            id: id ?? this.id,
            nombresApellidos: nombresApellidos ?? this.nombresApellidos,
            correo: correo ?? this.correo,
            cedula: cedula ?? this.cedula,
            telefono: telefono ?? this.telefono,
            descripcion: descripcion ?? this.descripcion,
            estado: estado ?? this.estado,
            creacion: creacion ?? this.creacion,
            actualizacion: actualizacion ?? this.actualizacion,
        );

    factory UsuarioModel.fromRawJson(String str) => UsuarioModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        nombresApellidos: json["nombres_apellidos"],
        correo: json["correo"],
        cedula: json["cedula"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        estado: json["estado"],
        creacion: json["creacion"] == null ? null : DateTime.parse(json["creacion"]),
        actualizacion: json["actualizacion"] == null ? null : DateTime.parse(json["actualizacion"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombres_apellidos": nombresApellidos,
        "correo": correo,
        "cedula": cedula,
        "telefono": telefono,
        "descripcion": descripcion,
        "estado": estado,
        "creacion": creacion?.toIso8601String(),
        "actualizacion": actualizacion?.toIso8601String(),
    };
}
