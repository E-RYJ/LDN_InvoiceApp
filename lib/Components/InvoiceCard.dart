import 'package:flutter/material.dart';

class InvoiceCard extends StatelessWidget {
  final String remitente;
  final String precio;
  final String fecha;
  final String producto;
  final String cantidad;
  const InvoiceCard({required this.remitente, required this.precio, required this.fecha, required this.producto,required this.cantidad});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){

      },
      title: Text(remitente),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(producto),
          Text('$cantidad m²'),
          Text(fecha),
        ],
      ),
      trailing: Text('\$ ${precio}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
    );
  }
}
