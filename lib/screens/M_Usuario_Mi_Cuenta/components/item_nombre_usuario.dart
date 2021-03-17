import 'package:flutter/material.dart';


class ItemNombre extends StatelessWidget {
  const ItemNombre({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            SizedBox(width: 20),
            Expanded(
                child: Text (
                    text,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38,color: Colors.black),

                )
            ),
          ],
        ),
      ),
    );
  }
}