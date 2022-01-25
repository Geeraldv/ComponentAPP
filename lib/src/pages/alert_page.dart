import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child:ElevatedButton(
          child: Text('Mostrar alerta'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape:StadiumBorder(),
          ),
          onPressed: ()=>_mostrarAlert(context),
          ) ,
        ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
        
        ),
    );
  }

  void _mostrarAlert(BuildContext context){


    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context){


        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text('Titulo'),
          content:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la caja de alerta'),
              FlutterLogo(size: 100.0,)

          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: ()=> Navigator.of(context).pop(),
            ),

          TextButton(
            child: Text('Ok'),
            onPressed: (){
              Navigator.of(context).pop();
            },
            )
        ],

        );
      }
      
      
      
      );

  }
}