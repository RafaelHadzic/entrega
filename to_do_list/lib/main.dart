import 'dart:math';
import 'package:flutter/material.dart';
import 'package:to_do_list/formulario.dart';
import 'package:to_do_list/lista_tarefas.dart';
import 'tarefas.dart';
import 'formulario.dart';

main(List<String> args) {
  return runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tr = Tarefas();

  _removeTarefa(String id) {
    setState(() {
      _tarefas.removeWhere((tr) => tr.id == id);
    });
  }

  _openTaskFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return FormularioTarefa(_addTarefa);
        });
  }
  
  final _tarefas = [
    Tarefas(
      id: 't1',
      titulo: 'Tarefa de Cálculo',
      descricao: 'Seção 1.2 e 1.3',
      data: DateTime.now(),
      status: 'Dentro do Prazo',
    ),
    Tarefas(
      id: 't2',
      titulo: 'Tarefa de GA',
      descricao: 'Lista de exercícios',
      data: DateTime.now(),
      status: 'Fora do Prazo',
    ),
    Tarefas(
      id: 't3',
      titulo: 'Tarefa de Metodologia',
      descricao: 'Ver Slides',
      data: DateTime.now(),
      status: 'Prestes a Vencer',
    )
  ];

  _addTarefa(String titulo, String descricao, DateTime data, String status) {
    final newTarefa = Tarefas(
      id: Random().nextDouble().toString(),
      titulo: titulo,
      descricao: descricao,
      data: data,
      status: status,
    );
    setState(() {
      _tarefas.add(newTarefa);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[],
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 512,
            child: ListaDeTarefas(_tarefas, _removeTarefa),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTaskFormModal(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
