
class Cuentas{
   final String user;
   static final String TABLE_NAME = "cuentas";
   final String correo_electronico;
   final String contrasenia;
   final String fecha_compra;
   final String fecha_venta;
   final String plataforma;
   final String membresia;
   final int pantallas;
   final double precio;
   final bool pagado;

   Cuentas({this.correo_electronico,
             this.contrasenia,
             this.fecha_compra,
             this.fecha_venta,
             this.plataforma,
             this.membresia,
             this.pantallas,
             this.precio,
             this.pagado,
             this.user});


   Map<String, dynamic> toMap() {
     return {
       'correo_electronico': correo_electronico,
       'contrasenia': contrasenia,
       'fecha_compra': fecha_compra,
       'fecha_venta': fecha_venta,
       'plataforma': plataforma,
       'membresia': membresia,
       'pantallas': pantallas,
       'precio': precio,
       'pagado': pagado,
       'user': user
     };
   }
   factory Cuentas.fromJson(Map<String, dynamic> parsedJson) {
    return Cuentas(
        correo_electronico: parsedJson['correo_electronico'],
        contrasenia: parsedJson['contrasenia'],
        fecha_compra: parsedJson['fecha_compra'],
        fecha_venta: parsedJson['fecha_venta'],
        plataforma: parsedJson['plataforma'],
        membresia: parsedJson['membresia'],
        pantallas: parsedJson['pantallas'],
        precio: parsedJson['precio'],
        pagado: parsedJson['pagado'],
        user: parsedJson['user']);
  }
}