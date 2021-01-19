import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCompoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCompoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transfêrencia'),
      ),
      body: Column(
        children: [
          Editor(
              controlador: _controladorCompoNumeroConta,
              rotulo: 'Número da conta',
              dica: '0000'),
          Editor(
              controlador: _controladorCompoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on),
          RaisedButton(
            onPressed: () => _criaTransferencia(),
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }

  void _criaTransferencia() {
    final int numeroConta =
        int.tryParse(_controladorCompoNumeroConta.text);
    final double valor = double.tryParse(_controladorCompoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada =
          Transferencia(numeroConta: numeroConta, valor: valor);
      debugPrint('$transferenciaCriada');
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferencias'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(numeroConta: 100, valor: 200.5)),
          ItemTransferencia(Transferencia(numeroConta: 200, valor: 250.5)),
          ItemTransferencia(Transferencia(numeroConta: 300, valor: 300.5)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
        ),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia({this.numeroConta, this.valor});

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
