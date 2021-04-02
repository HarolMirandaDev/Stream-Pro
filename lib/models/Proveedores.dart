
class Proveedores{
   static final String TABLE_NAME = "proveedores";
   final String nombre;
   final String pais;
   final String telefono;
   final String user;
   final String red_social;


   Proveedores({
             this.nombre,
             this.pais,
             this.red_social,
             this.telefono,
              this.user});

    @override
    String toString() {
      return nombre;
    }

   Map<String, dynamic> toMap() {
     return {
       'nombre': nombre,
       'pais': pais,
       'red_social': red_social,
       'telefono': telefono,
       'user': user
     };
   }

   factory Proveedores.fromJson(Map<String, dynamic> parsedJson){
     return Proveedores(
         nombre: parsedJson['nombre'],
         pais : parsedJson['pais'],
         red_social : parsedJson['red_social'],
         telefono : parsedJson ['telefono'],
         user: parsedJson['user']
     );
   }
}