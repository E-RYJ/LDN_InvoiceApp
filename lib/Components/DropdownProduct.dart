import 'package:flutter/material.dart';
import 'package:prototipo/Components/DecoratedTextField.dart';

class DropdownProduct extends StatefulWidget {

  @override
  _DropdownProductState createState() => _DropdownProductState();
}

class _DropdownProductState extends State<DropdownProduct> {
  String seleccionado = 'Malla sombra Raschel 90%';

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
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
      ],
    );
  }
}