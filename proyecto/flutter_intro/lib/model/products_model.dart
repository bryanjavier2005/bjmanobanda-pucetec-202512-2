class ProductsModel {
  final int id;
  final String codigo;
  final String nombre;
  final String descripcion;
  final String tipo_unidad;
  final int cantidad_bodega;
  final String? precio_unitario;
  final String observacion;
  final int usuario_id;

  ProductsModel({
    required this.id,
    required this.codigo,
    required this.nombre,
    required this.descripcion,
    required this.tipo_unidad,
    required this.cantidad_bodega,
    required this.precio_unitario,
    required this.observacion,
    required this.usuario_id,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      codigo: json['codigo'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      tipo_unidad: json['tipo_unidad'],
      cantidad_bodega: json['cantidad_bodega'],
      precio_unitario: json['precio_unitario'],
      observacion: json['observacion'],
      usuario_id: json['usuario_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'nombre': nombre,
      'descripcion': descripcion,
      'tipo_unidad': tipo_unidad,
      'cantidad_bodega': cantidad_bodega,
      'precio_unitario': precio_unitario,
      'observacion': observacion,
      'usuario_id': usuario_id,
    };
  }
}

