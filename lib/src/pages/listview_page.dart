import 'package:flutter/material.dart';

import 'dart:async';

class ListViewPage extends StatefulWidget {
  const ListViewPage({ Key? key }) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<int> _listaNumeros = [];
  int _ultimoItems = 0;
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();


    _scrollController.addListener(() {
      
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent ){
      //  _agregar10();

      fetchData();
      }



    });
  }

  @override
  void dispose() {
    
    super.dispose();
  //Sirve para vacear el dispose de una pagina
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('ListView Page') ,
      ),

      body: Stack(
        children: [
        _crearListView(),
        _crearLoading(),
      ],)
      
      
      
      

    );

  }

  Widget _crearListView(){

    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        //se usa para contar la cantidad de elementos que queremos en el momento
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
    
          final imagen = _listaNumeros[index];
          
          
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://picsum.photos/id/$imagen/500/300')
            );
        },
      ),
    );


  }

  Future obtenerPagina1()async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItems++;
      _agregar10();

    });

    return Future.delayed(duration);
  }


  void _agregar10(){

    for (var i = 0; i < 10; i++) {
      _ultimoItems++;
      _listaNumeros.add(_ultimoItems);

    }
    setState(() {});
  }

Future fetchData ()async{

  _isLoading = true;
  setState(() {});

  final duration = new Duration( seconds: 2);

  return new Timer(duration, respuestaHTTP );

}

void respuestaHTTP(){
  
  _isLoading = false;

  _scrollController.animateTo(
    _scrollController.position.pixels + 100,
    curve: Curves.fastOutSlowIn,
    duration:Duration(microseconds: 250),


  );

  _agregar10();


}


Widget _crearLoading(){

  if(_isLoading){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      CircularProgressIndicator(),

        ],
      ),
      SizedBox(height:15.0)
      ],
    );
    
    
    
  }else {
    return Container();
  }
}

}