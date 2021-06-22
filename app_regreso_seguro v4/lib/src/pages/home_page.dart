import 'package:app_regreso_seguro/src/bloc/provide.dart';
import 'package:app_regreso_seguro/src/widgets/background.dart';
import 'package:app_regreso_seguro/src/widgets/card_table.dart';
import 'package:app_regreso_seguro/src/widgets/navigation_bar.dart';
import 'package:app_regreso_seguro/src/widgets/page_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _HomeBody(),
        ],
      ),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Ttulos
          PageTilte(),

          //Tarjetas
          CardTable(),
        ],
      ),
    );
  }
}
