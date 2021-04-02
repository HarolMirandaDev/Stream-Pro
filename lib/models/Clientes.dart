
class Clientes{
  static final String TABLE_NAME = "clientes";
  final int id_clientes;
  final String nombre;
  final String pais;
  final String telefono;
  final String correo_electronico;
  final String fecha_ventas;

  Clientes({this.id_clientes,
            this.nombre,
            this.pais,
            this.telefono,
            this.correo_electronico,
            this.fecha_ventas});


  @override
  String toString() {
    return nombre;
  }

  Map<String, dynamic> toMap() {
    return {
      'id_clientes': id_clientes,
      'nombre': nombre,
      'pais': pais,
      'telefono': telefono,
      'correo_electronico': correo_electronico,
      'fecha_venta':fecha_ventas,
    };
  }
}