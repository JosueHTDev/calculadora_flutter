import 'package:flutter/material.dart';

class BtnLight extends StatelessWidget {
  final String numero;
  final void Function(String) onClick;
  const BtnLight({super.key, required this.numero, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Click $numero");
        this.onClick(this.numero);
      }, 
      child: Text(this.numero, style: TextStyle(fontSize: 24, color: Colors.blueGrey)),
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white70)),
    );
  }
}

class BtnDark extends StatelessWidget {
  final String numero;
  const BtnDark({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {}, 
      child: Text(this.numero, style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 139, 164, 177))),
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color.fromARGB(133, 241, 229, 229))),
    );
  }
}