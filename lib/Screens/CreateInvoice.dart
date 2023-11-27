import 'package:flutter/material.dart';
import 'package:prototipo/Components/DropdownProduct.dart';
import 'package:prototipo/Database/Query.dart';

import '../Components/DecoratedTextField.dart';

class CreateInvoice extends StatefulWidget {
  const CreateInvoice({super.key});

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}

class _CreateInvoiceState extends State<CreateInvoice> {
  TextEditingController remitenteController = TextEditingController();
  TextEditingController cantidadController = TextEditingController();
  String seleccionado = 'Malla sombra Raschel 90%';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Cotizacion'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(35),
          child: ListView(
            children: [
              Text('Selecciona y rellena todos los campos',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              DecoratedTextField(hintText: 'Remitente', controller: remitenteController),
              SizedBox(height: 20,),
              DropdownButton<String>(
                value: seleccionado,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    seleccionado = nuevoValor!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Malla sombra Raschel 90%',
                    child: Text('Malla sombra Raschel 90%'),
                  ),
                  DropdownMenuItem(
                    value: 'Malla sombra importada 90%',
                    child: Text('Malla sombra importada 90%'),
                  ),
                  DropdownMenuItem(
                    value: 'Malla sombra importada 95%',
                    child: Text('Malla sombra importada 95%'),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              DecoratedTextField(hintText: 'Cantidad en m²', controller: cantidadController),
              SizedBox(height: 20,),
              FilledButton(
                  onPressed: (){
                    Query().InsertInvoice(remitenteController.text);
                    Query().InsertProductoCotizado(cantidadController.text, seleccionado);
                    Navigator.pop(context);
                  },
                  child: Text('Generar pdf'))
            ],
          ),
        ),
      ),
    );
  }
}

