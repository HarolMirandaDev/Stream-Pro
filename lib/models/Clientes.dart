class Clientes {
  static final String TABLE_NAME = "clientes";
  final String user;
  final String nombre;
  final String pais;
  final String telefono;
  final String correo_electronico;
  final String fecha_ventas;

  Clientes(
      {this.nombre,
      this.pais,
      this.telefono,
      this.correo_electronico,
      this.fecha_ventas,
      this.user});

  @override
  String toString() {
    return nombre;
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'pais': pais,
      'telefono': telefono,
      'correo_electronico': correo_electronico,
      'fecha_venta': fecha_ventas,
      'user': user
    };
  }

  factory Clientes.fromJson(Map<String, dynamic> parsedJson) {
    return Clientes(
        nombre: parsedJson['nombre'],
        pais: parsedJson['pais'],
        telefono: parsedJson['telefono'],
        correo_electronico: parsedJson['correo_electronico'],
        fecha_ventas: parsedJson['fecha_venta'],
        user: parsedJson['user']);
  }
}
