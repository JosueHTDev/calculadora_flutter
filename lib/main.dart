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
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey[850]!,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850],
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
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
      body: Container(
        color: Colors.grey[900],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[700]!, width: 1),
                ),
                child: TextField(
                  controller: _ctrlDisplay,
                  textAlign: TextAlign.right,
                  readOnly: true,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '0',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              
              Container(
                width: 340,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildOperationButton("C", Colors.grey[600]!, onPressed: _clear),
                        _buildOperationButton("⌫", Colors.grey[600]!, onPressed: _backspace, isIcon: true),
                        _buildOperationButton("%", Colors.grey[600]!, onPressed: () => setAux1("%")),
                        _buildOperationButton("÷", Colors.orange[700]!, onPressed: () => setAux1("÷")),
                      ],
                    ),
                    const SizedBox(height: 12),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNumberButton("7"),
                        _buildNumberButton("8"),
                        _buildNumberButton("9"),
                        _buildOperationButton("×", Colors.orange[700]!, onPressed: () => setAux1("×")),
                      ],
                    ),
                    const SizedBox(height: 12),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNumberButton("4"),
                        _buildNumberButton("5"),
                        _buildNumberButton("6"),
                        _buildOperationButton("-", Colors.orange[700]!, onPressed: () => setAux1("-")),
                      ],
                    ),
                    const SizedBox(height: 12),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNumberButton("1"),
                        _buildNumberButton("2"),
                        _buildNumberButton("3"),
                        _buildOperationButton("+", Colors.orange[700]!, onPressed: () => setAux1("+")),
                      ],
                    ),
                    const SizedBox(height: 12),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNumberButton("0", isZero: true),
                        _buildNumberButton("."),
                        _buildOperationButton("=", Colors.orange[700]!, onPressed: () {
                          setAux2();
                          calcular();
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.grey[800],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildNumberButton(String text, {bool isZero = false}) {
    return Container(
      width: isZero ? 160 : 75,
      height: 75,
      child: ElevatedButton(
        onPressed: () => _addNumber(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[700],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildOperationButton(String text, Color color, {VoidCallback? onPressed, bool isIcon = false}) {
    return Container(
      width: 75,
      height: 75,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.2),
        ),
        child: isIcon
            ? Icon(Icons.backspace, size: 24)
            : Text(
                text,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}