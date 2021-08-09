import 'package:bytebank_app/models/transferencia.dart';
import 'package:bytebank_app/screens/transferencia/formulario_transferencias_page.dart';
import 'package:bytebank_app/widgets/item_transferencia_widget.dart';
import 'package:flutter/material.dart';

class ListaTransferenciasPage extends StatefulWidget {
  const ListaTransferenciasPage({Key? key}) : super(key: key);

  @override
  _ListaTransferenciasPageState createState() =>
      _ListaTransferenciasPageState();
}

class _ListaTransferenciasPageState extends State<ListaTransferenciasPage> {
  List<Transferencia> _listaTransferencias = [];
  static const title = "Lista de Transferências";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _listaTransferencias.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemTransferencia(_listaTransferencias[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          goToFormularioTransferenciaPage(context);
        },
      ),
    );
  }

  Future<dynamic> goToFormularioTransferenciaPage(BuildContext context) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FormularioTransferenciaPage();
    }));
    setState(() {
      _listaTransferencias.add(result);
    });
  }
}
