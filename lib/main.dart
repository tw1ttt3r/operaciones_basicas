import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operaciones Básicas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Operaciones Básicas'),
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
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double _resultado = 0.0;

  void _realizarOperacion(String operacion) {
    double num1 = double.tryParse(_controller1.text) ?? 0.0;
    double num2 = double.tryParse(_controller2.text) ?? 0.0;

    setState(() {
      switch (operacion) {
        case '+':
          _resultado = num1 + num2;
          break;
        case '-':
          _resultado = num1 - num2;
          break;
        case '*':
          _resultado = num1 * num2;
          break;
        case '/':
          _resultado = num2 != 0 ? num1 / num2 : double.nan;
          break;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _controller1.clear();
      _controller2.clear();
      _resultado = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 1'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 2'),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => _realizarOperacion('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _realizarOperacion('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _realizarOperacion('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _realizarOperacion('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: $_resultado',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reiniciar,
        tooltip: 'Reiniciar',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
