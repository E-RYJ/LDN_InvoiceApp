import 'package:flutter/material.dart';
import 'package:prototipo/Components/InvoiceCard.dart';
import 'package:prototipo/Database/Query.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> invoices = [];

  @override
  void initState(){
    invoices.clear();
    Query().getInvoices();
    invoices = Query.qInvoices;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotizador'),
      ),
      body: SafeArea(
          child: ListView(
            children: invoices,
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Query.qInvoices.clear();
          Navigator.pushNamed(context, '/CreateInvoice');
          Query().getInvoices();
        },
        child: Icon(Icons.add),

      ),
    );
  }
}
