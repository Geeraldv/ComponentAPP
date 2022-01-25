import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre   = '';
  String _email    = '';
  String _password = '';
  String _fecha = '';
  String _opcionSelecionada = 'comer';
  List<String> _poderes = ['Volar','Rayos X','Super Aliento', 'Super Fuerza'];
  TextEditingController _inputController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InputPage"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:10.0,vertical:20.0,),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
          
        ],
      ),
    );
  }

 Widget _crearInput() {

   return TextField(
     //autofocus:true,
     textCapitalization: TextCapitalization.sentences,
     decoration: InputDecoration(
       counter: Text('Letras ${_nombre.length}'),
       labelText: 'Nombre',
       hintText: 'Nombre de la persona',
       helperText:'Solo es un nombre',
       suffixIcon:Icon(Icons.accessibility),
       icon:Icon(Icons.account_circle),
       border:OutlineInputBorder(
         borderRadius: BorderRadius.circular(10.0),),
     ),
     onChanged:(value){
       setState(() {
         _nombre = value;
       });
     },
     

     

   );
    
  }

  Widget _crearEmail(){
    
    return TextField(
      
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon:Icon(Icons.email),
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10.0) ,),
      ),
      onChanged: (value){
        setState(() {
          _email = value;
        });
      },

    );
  }


  Widget _crearPassword(){

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText:'Password',
        hintText: 'password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),),

       ),
       onChanged: (value){
         setState(() {
           _password = value;
         });
       },
    );
  }




  Widget _crearFecha(BuildContext context){

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputController,
      decoration: InputDecoration(
        labelText:'Fecha de nacimiento',
        hintText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar_rounded),
        icon: Icon(Icons.calendar_today),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),),

       ),
       onTap: (){
         // se usa para quitar el focus de un input y no poder tocarlo
         FocusScope.of(context).requestFocus(new FocusNode());

         _selectDate(context);


       },
    );


  }


  _selectDate(BuildContext context) async{

    DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2016), 
      lastDate: new DateTime(2025),
      locale:Locale("es", 'ES'),
      );

    if(picked != null){

      setState(() {
        _fecha = picked.toString();
        _inputController.text = _fecha;
      });

    }
  }
  

  List<DropdownMenuItem<String>> _getOpcionesDropDown(){

    List<DropdownMenuItem<String>> _lista = [];

    _poderes.forEach((poder) {

      _lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,

        ));
     });


  return _lista;

  }

  Widget _crearDropDown(){

    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
          DropdownButton(
            hint: Text(_opcionSelecionada),
            // value: _poderes[0],
            items: _getOpcionesDropDown(),
            onChanged:(opt){
              setState(() {
                print(opt);
            _opcionSelecionada = opt.toString();  
            });

          },
        )
],);
    
    
    
    
  }



  Widget _crearPersona() {

    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
      trailing: Text(_opcionSelecionada),

    );
  }

  

  
}
