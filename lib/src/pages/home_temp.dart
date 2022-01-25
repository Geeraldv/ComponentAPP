import 'package:flutter/material.dart';



class HomeTemp extends StatelessWidget {
  

  final opciones = ['Uno', 'Dos', 'Tres','Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compenent App'),),
        // body: ListView(children: _crearItems(),
        body: ListView(children: _crearItemsCorto(),
        ),
    );
  }



  List<Widget> _crearItems(){

      List<Widget> lista = [];

      for (String opt in opciones) {

        final tempWidget = ListTile(
          title: Text(opt),
        );

        lista.add(tempWidget);
        lista.add(Divider(color: Colors.grey[900],));
        
      }


    return lista;

  }

 List<Widget> _crearItemsCorto(){

   return opciones.map((items) {

     return Column(
       children: [
         ListTile(
           title: Text(items),
           subtitle: Text('Cualquier Cosa'),
           leading: Icon(Icons.account_box_sharp),
           trailing: Icon(Icons.keyboard_arrow_right),
           onTap: (){},
         ),
         Divider(),
       ],
     );
   }).toList();
 }

}