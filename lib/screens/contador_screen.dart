import 'package:flutter/material.dart';
import 'package:flutter_testes_estudo/contador.dart';

class ContadorScreen extends StatefulWidget {
  const ContadorScreen({super.key});

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {
  Contador contador = Contador();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "O mais SIMPLES dos\ncontadores",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    contador.decrementar();
                  });
                },
                child: const Text("-"),
              ),
              Text(
                "${contador.valor}",
                style: const TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    contador.incrementar();
                  });
                },
                child: const Text("+"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
