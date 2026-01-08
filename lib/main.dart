import 'package:calculadora_flutter/widgets/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huarocc Calculadora', // colocar el nombre del sitio
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('1'),
            Text('2'),
            Row(
              children: [
                BtnDark(numero: "%",),
                BtnDark(numero: "CE",),
                BtnDark(numero: "C",),
                BtnDark(numero: "⌫",),
              ],
            ),
            Row(
              children: [
                BtnDark(numero: "1/x",),
                BtnDark(numero: "x²",),
                BtnDark(numero: "√",),
                BtnDark(numero: "÷",),
              ],
            ),
            Row(
              children: [
                BtnLight(numero: "7", onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnLight(numero: "8", onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnLight(numero: "9", onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnDark(numero: "X",),
              ],
            ),
            Row(
              children: [
                BtnLight(numero: "4", onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnLight(numero: "5",onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnLight(numero: "6",onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnDark(numero: "-",),
              ],
            ),
            Row(
              children: [
                BtnLight(numero: "1",onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnLight(numero: "2",onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnLight(numero: "3",onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnDark(numero: "+",),
              ],
            ),
            Row(
              children: [
                BtnDark(numero: "+/-",),
                BtnLight(numero: "0",onClick: (String numero){
                  print("Main: $numero");
                },),
                BtnDark(numero: ".",),
                BtnDark(numero: "=",),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}