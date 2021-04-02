
class Usuarios{
   static final String TABLE_NAME = "usuarios";
   final int id_usuario;
   final String displayname;
   final String correo_electronico;
   final String contrasenia;
   final String telefono;
   final String direccion;

   Usuarios({this.id_usuario,
             this.displayname,
             this.correo_electronico,
             this.contrasenia,
             this.telefono,
             this.direccion});

    @override
    String toString() {
      return displayname;
    }

   Map<String, dynamic> toMap() {
     return {
       'id_usuario': id_usuario,
       'displayname': displayname,
       'correo_electronico': correo_electronico,
       'contrasenia': contrasenia,
       'telefono': telefono,
       'direccion': direccion
     };
   }
}