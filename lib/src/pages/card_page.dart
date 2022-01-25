import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),),
    
      body: ListView(
        padding:EdgeInsetsDirectional.all(10.0),
        children: <Widget> [
        _cardTipo1(),
        SizedBox(height: 20.0,),
        _cardTipo2(),
        SizedBox(height: 20.0,),
        _cardTipo1(),
        SizedBox(height: 20.0,),
        _cardTipo2(),
        SizedBox(height: 20.0,),
        _cardTipo1(),
        SizedBox(height: 20.0,),
        _cardTipo2(),
        SizedBox(height: 20.0,),
        _cardTipo1(),
        SizedBox(height: 20.0,),
        _cardTipo2(),
        SizedBox(height: 20.0,),
        ],
      ),
    );
  }

 Widget _cardTipo1() {


   return Card(
     elevation: 10.0,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0) ),

     child: Column(
       children: [
        ListTile(
           leading: Icon(Icons.person_outline, color:Colors.blue,),
           title:Text('Soy el titulo de esta tarjeta ') ,
           subtitle: Text('Lorem Ipsum is simply dummy text of the printing'),
         ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton( 
              child:Text('Cancelar') ,
              onPressed: (){},),
            TextButton(
              child: Text('Ok'),
              onPressed: (){},
            )
          ],
        )
       ],
     ),
   );
 }


Widget _cardTipo2(){

  return Card(
    elevation: 10.0,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      children: [

        FadeInImage(

          fit: BoxFit.cover,
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image:NetworkImage('https://cdn.theatlantic.com/thumbor/lDNOafbuoLvPlFyPSz67gDJFqbM=/1500x1005/media/img/photo/2020/02/winners-2019-international-landscap/p01_SanderGrefte14180-443/original.jpg'),
          height: 300.0,
          fadeInDuration: Duration(microseconds: 2000),
          ),

        Container(
          child: Text('No se que poner aqui'),
          padding: EdgeInsets.all(20.00),
          ),  


        // Image(
        //   image: NetworkImage('https://cdn.theatlantic.com/thumbor/lDNOafbuoLvPlFyPSz67gDJFqbM=/1500x1005/media/img/photo/2020/02/winners-2019-international-landscap/p01_SanderGrefte14180-443/original.jpg')),
      ],
    ),
  );
}

}