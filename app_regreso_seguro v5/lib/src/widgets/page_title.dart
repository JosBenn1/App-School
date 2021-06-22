import 'package:flutter/material.dart';

class PageTilte extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bienvenidos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
            SizedBox(height: 10.0,),
            Text('Elije una opcion', style: TextStyle(fontSize: 16, color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
