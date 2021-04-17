import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_pro/models/Cliente.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';
import 'package:stream_pro/models/Cuentas.dart';

class RenovacionCliente extends StatelessWidget {
  const RenovacionCliente({
    this.width = 100,
    this.aspectRetio = 1.02,
    @required this.snapshot
  });

 final QueryDocumentSnapshot snapshot;
  final double width, aspectRetio;


  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(Cuentas.TABLE_NAME)
          .where("user", isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .where("correoElectronico", isEqualTo: this.snapshot.data()["correo_electronico"])
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error en la base de datos");
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          default:
            return Builder(
              builder: (context) {

                String imagen_dato = "";

                switch(snapshot.data.docs[0].data()["plataforma"]){
                  case 'Netflix':
                    imagen_dato = "assets/images/item_netflix.png";
                    break;
                  case 'Spotify':
                    imagen_dato = "assets/images/item_spotify.png";
                    break;
                  case 'Amazon Prime Video':
                    imagen_dato = "assets/images/item_prime_video.png";
                    break;
                  case 'Disney Plus':
                    imagen_dato = "assets/images/item_disney_plus.png";
                    break;
                  case 'HBO GO':
                    imagen_dato = "assets/images/item_hbo_go.png";
                    break;
                  case 'YouTube':
                    imagen_dato = "assets/images/item_youtube.png";
                    break;
                  default:
                    imagen_dato = "assets/images/item_youtube.png";

                    break;

                }




                Cliente cliente = new Cliente(idCliente: this.snapshot.id,
                    images: [imagen_dato],
                    colors: [
                      Color(0xFFF6625E),
                      Color(0xFF836DB8),
                      Color(0xFFDECB9C),
                      Colors.white,
                    ],
                    cliente: this.snapshot.data()['nombre'],
                    precio: double.parse(snapshot.data.docs[0].data()["precio"].toString()),
                    descripcion: "");

                return   Padding(
                  padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: SizedBox(
                    width: getProportionateScreenWidth(width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.02,
                          child: Container(
                            padding: EdgeInsets.all(getProportionateScreenWidth(0)),
                            decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Hero(
                              tag: cliente.idCliente.toString(),
                              child: Image.asset(cliente.images[0]),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          cliente.cliente,
                          style: TextStyle(color: Colors.black),
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\L. ${cliente.precio}",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(17),
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                height: getProportionateScreenWidth(28),
                                width: getProportionateScreenWidth(28),
                                decoration: BoxDecoration(
                                  color: cliente.pagado
                                      ? kPrimaryColor.withOpacity(0.15)
                                      : kSecondaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),

                                child: SvgPicture.asset(
                                  "assets/icons/Icono Corazon 2.svg",
                                  color: cliente.pagado
                                      ? Color(0xFFAD1457)
                                      : Color(0xFFFCE4EC),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );;
              },
            );
            break;
        }
      },
    );
  }
}
