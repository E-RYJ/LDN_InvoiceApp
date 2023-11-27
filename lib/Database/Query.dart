import 'package:flutter/cupertino.dart';
import 'package:mysql1/mysql1.dart';
import 'package:prototipo/Components/InvoiceCard.dart';
import 'package:prototipo/Database/DBConnection.dart';

class Query{
  static List<Widget> qInvoices = [];
  Future<void> getInvoices() async{
    MySqlConnection con = await DBConnection.getConnection();

    try{
        Results results = await con.query('SELECT C.Fecha,C.Remitente,P.Nombre AS ProductoComprado, PC.cantidad, P.Precio FROM Cotizacion C JOIN  ProductoCotizado PC ON C.idCotizacion = PC.idCotizacion JOIN Producto P ON PC.idProducto = P.idProducto;');
        for(var row in results){
          var fecha = row['Fecha'];
          var remitente = row['Remitente'];
          var productoComprado = row['ProductoComprado'];
          double cantidad = row['cantidad'];
          double precio = row['Precio'];
          int precioI = precio.round();
          int cantidadI=cantidad.round();
          int precioFinal = precioI*cantidadI;
          qInvoices.add(InvoiceCard(remitente: remitente, precio: '${precioFinal}', fecha: '$fecha', producto: productoComprado,cantidad: '${cantidad}'));
        }
    }catch(e){
      print(e);
    }finally{
      con.close();
    }
  }

  Future<void> InsertInvoice(String remitente) async{
    MySqlConnection con = await DBConnection.getConnection();
    try{
      Results results = await con.query('INSERT INTO Cotizacion(Fecha,Remitente) VALUES(CURRENT_DATE,?)',[remitente]);
    }catch(e){
      print(e);
    }finally{
      con.close();
    }
  }

  Future<void> InsertProductoCotizado(String cantidad, String producto) async{
    MySqlConnection con = await DBConnection.getConnection();
    int  cant = int.parse(cantidad);
    int idreal = 0;
    if(producto == 'Malla sombra Raschel 90%'){
      idreal = 1;
    }
    if(producto == 'Malla sombra importada 90%'){
      idreal = 2;
    }
    if(producto == 'Malla sombra importada 95%'){
      idreal = 3;
    }
    try{
      Results results = await con.query('INSERT INTO ProductoCotizado(cantidad,idCotizacion,idProducto) VALUES(?,(SELECT MAX(idCotizacion) FROM Cotizacion),?)',[cant,idreal]);
    }catch(e){
      print(e);
    }finally{
      con.close();
    }
  }
}