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
      title: 'Rojas Calculadora',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
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
  final TextEditingController _ctrlDisplay = TextEditingController(text: ""); 
  double aux1 = 0;
  double aux2 = 0;
  String operacion = "";

  void setAux1(String sim) {
    operacion = sim;
    aux1 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }
  
  void setAux2() {
    aux2 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }
  
  void calcular() {
    double resultado = 0;
    if (operacion == "+") {
      resultado = aux1 + aux2;
    } else if (operacion == "-") {
      resultado = aux1 - aux2;
    } else if (operacion == "×") {
      resultado = aux1 * aux2;
    } else if (operacion == "÷") {
      if (aux2 != 0) {
        resultado = aux1 / aux2;
      } else {
        _ctrlDisplay.text = "Error: División por 0";
        return;
      }
    } else if (operacion == "%") {
      resultado = aux1 % aux2;
    }
    _ctrlDisplay.text = "$resultado";
  }

  void _addNumber(String number) {
    setState(() {
      _ctrlDisplay.text += number;
    });
  }

  void _clear() {
    setState(() {
      _ctrlDisplay.text = "";
      aux1 = 0;
      aux2 = 0;
      operacion = "";
    });
  }

  void _backspace() {
    if (_ctrlDisplay.text.isNotEmpty) {
      setState(() {
        _ctrlDisplay.text = _ctrlDisplay.text.substring(0, _ctrlDisplay.text.length - 1);
      });
    }
  }

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _ctrlDisplay,
                textAlign: TextAlign.right,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Resultado'
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _clear,
                  child: Text("C"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _backspace,
                  child: Icon(Icons.backspace),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setAux1("%"),
                  child: Text("%"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setAux1("÷"),
                  child: Text("÷"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _addNumber("7"),
                  child: Text("7"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addNumber("8"),
                  child: Text("8"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addNumber("9"),
                  child: Text("9"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setAux1("×"),
                  child: Text("×"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _addNumber("4"),
                  child: Text("4"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addNumber("5"),
                  child: Text("5"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addNumber("6"),
                  child: Text("6"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setAux1("-"),
                  child: Text("-"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _addNumber("1"),
                  child: Text("1"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addNumber("2"),
                  child: Text("2"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addNumber("3"),
                  child: Text("3"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setAux1("+"),
                  child: Text("+"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _addNumber("0"),
                  child: Text("0"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _addNumber("."),
                  child: Text("."),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setAux2();
                    calcular();
                  },
                  child: Text("="),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(70, 70),
                  ),
                ),
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