import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_pro/models/Cliente.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class RenovacionCliente extends StatelessWidget {
  const RenovacionCliente({
    Key key,
    this.width = 100,
    this.aspectRetio = 1.02,
    @required this.cliente,
  }) : super(key: key);

  final double width, aspectRetio;
  final Cliente cliente;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      fontSize: getProportionateScreenWidth(18),
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
    );
  }
}
