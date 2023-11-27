import 'package:flutter/material.dart';
import 'package:prototipo/Screens/CreateInvoice.dart';
import 'package:prototipo/Screens/ViewInvoice.dart';

import 'Screens/MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cotizador',
      theme: ThemeData(
        useMaterial3: true,
        
      ),
      routes: {
        '/CreateInvoice':(context) => CreateInvoice(),
        '/ViewInvoice':(context)=>ViewInvoice()
      },
      home: MainScreen(),
    );
  }
}
