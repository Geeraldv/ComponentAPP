import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:componentes/src/pages/home_temp.dart';

import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
    ],

    supportedLocales: [
    Locale('en', 'US'), 
    Locale('es', 'ES'), 
  ],


      title: 'Componentes App',
      // home: HomeTemp(),
      // home: HomePage(),
      initialRoute: '/',

      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings setting){


        print('Ruta llamada: ${setting.name}');


        return MaterialPageRoute(
          builder:(BuildContext context)=> AlertPage(), 
        );
      },
    );
  }
}