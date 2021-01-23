
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transfêrencia';
const _rotuloCompoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _dicaCampoNumeroConta = '0000';
const _rotuloCompoNumeroConta = 'Número da conta';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCompoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCompoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            Editor(
                controlador: _controladorCompoNumeroConta,
                rotulo: _rotuloCompoNumeroConta,
                dica: _dicaCampoNumeroConta),
            Editor(
                controlador: _controladorCompoValor,
                rotulo: _rotuloCompoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta =
        int.tryParse(_controladorCompoNumeroConta.text);
    final double valor = double.tryParse(_controladorCompoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada =
      Transferencia(numeroConta: numeroConta, valor: valor);
      Navigator.pop(context, transferenciaCriada);
    }
  }

}