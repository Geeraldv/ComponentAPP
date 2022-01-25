

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorDelSlider = 100.0;
  bool _bloqueadorCheck = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 50.0,),
        child:Column(
          children:[
            _crearSlider(),
            _crearBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen())
          ]
        ) ,),
    );
  }



  Widget _crearSlider(){

    return Slider(
      value:_valorDelSlider,
      label: "Tamaño de la imagen",
      activeColor: Colors.indigo,
      // divisions:20,
      min: 50.0,
      max: 400.0,
      onChanged:(_bloqueadorCheck) ? null : (valor){

        setState(() {
          _valorDelSlider = valor;
        });
        print(valor);
      });
  }





  Widget _crearBox(){

    // return Checkbox(
    //   value: _bloqueadorCheck, 
    //   onChanged: (valor){
    //     setState(() {
    //      _bloqueadorCheck = valor!;

    //     });
    //   });


    return CheckboxListTile(
      title: Text('Bloquear Slide'),
      value: _bloqueadorCheck, 
      onChanged: (valor){
        setState(() {
          _bloqueadorCheck = valor!;
        });
      });
  }


  Widget _crearSwitch(){
    return SwitchListTile(
      title: Text('Bloquear Slide'),
      value: _bloqueadorCheck, 
      onChanged: (valor){
        setState(() {
        _bloqueadorCheck = valor;
        });
      });
  }




  Widget _crearImagen (){

    return Image(
      image: AssetImage('assets/jordan.png'),
      width: _valorDelSlider,
      fit: BoxFit.contain,
      );
     
  }
}