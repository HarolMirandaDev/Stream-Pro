
class Cuentas{
   static final String TABLE_NAME = "cuentas";
   final int id_cuentas;
   final String correo_electronico;
   final String contrasenia;
   final String fecha_compra;
   final String fecha_venta;
   final String plataforma;
   final String membresia;
   final int pantallas;
   final double precio;
   final bool pagado;

   Cuentas({this.id_cuentas,
             this.correo_electronico,
             this.contrasenia,
             this.fecha_compra,
             this.fecha_venta,
             this.plataforma,
             this.membresia,
             this.pantallas,
             this.precio,
             this.pagado});


   Map<String, dynamic> toMap() {
     return {
       'id_cuentas': id_cuentas,
       'correo_electronico': correo_electronico,
       'contrasenia': contrasenia,
       'fecha_compra': fecha_compra,
       'fecha_venta': fecha_venta,
       'plataforma': plataforma,
       'membresia': membresia,
       'pantallas': pantallas,
       'precio': precio,
       'pagado': pagado,
     };
   }
}