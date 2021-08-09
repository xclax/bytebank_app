import 'package:bytebank_app/models/transferencia.dart';
import 'package:bytebank_app/widgets/editor_text_form.dart';
import 'package:flutter/material.dart';

class FormularioTransferenciaPage extends StatefulWidget {
  const FormularioTransferenciaPage({Key? key}) : super(key: key);

  @override
  _FormularioTransferenciaPageState createState() =>
      _FormularioTransferenciaPageState();
}

class _FormularioTransferenciaPageState
    extends State<FormularioTransferenciaPage> {
  TextEditingController _textEditingControllerNumeroConta =
      TextEditingController();
  TextEditingController _textEditingControllerValor = TextEditingController();
  static const title = 'Criando Transferência';
  static const hintTextConta = '0000';
  static const hintTextValor = '100.00';
  static const labelTextConta = 'Número da Conta';
  static const labelTextValor = 'Valor';
  static const buttonTextConfirmar = 'Confirmar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                textEditingController: _textEditingControllerNumeroConta,
                hintText: hintTextConta,
                labelText: labelTextConta,
              ),
              Editor(
                  textEditingController: _textEditingControllerValor,
                  hintText: hintTextValor,
                  labelText: labelTextValor,
                  icon: Icon(Icons.attach_money_rounded)),
              ElevatedButton(
                  onPressed: () {
                    criarTransferencia(context);
                  },
                  child: Text(buttonTextConfirmar))
            ],
          ),
        ));
  }

  void criarTransferencia(BuildContext context) {
    final int? numeroConta =
        int.tryParse(_textEditingControllerNumeroConta.text);
    final double? valor = double.tryParse(_textEditingControllerValor.text);

    final transferencia = Transferencia(valor!, numeroConta!);
    Navigator.pop(context, transferencia);
  }
}
