import 'package:flutter/material.dart';
import 'package:to_do_list/tarefas.dart';
import 'package:intl/intl.dart';

class ListaDeTarefas extends StatelessWidget {
  final List<Tarefas> tarefas;
  final void Function(String) onRemove;

  ListaDeTarefas(this.tarefas, this.onRemove);

  _selecionaTrashColor(String status) {
    if (status == "Dentro do Prazo") {
      return Colors.green[600];
    } else if (status == "Prestes a Vencer") {
      return Colors.yellow[900];
    } else if (status == "Fora do Prazo") {
      return Colors.red[600];
    }
  }

  _selecionaCorFonteTitulo(String status) {
    if (status == "Dentro do Prazo") {
      return TextStyle(
        color: Colors.green[600],
        fontWeight: FontWeight.bold,
      );
    } else if (status == "Prestes a Vencer") {
      return TextStyle(
        color: Colors.yellow[900],
        fontWeight: FontWeight.bold,
      );
    } else if (status == "Fora do Prazo") {
      return TextStyle(
        color: Colors.red[600],
        fontWeight: FontWeight.bold,
      );
    }
  }

  _selecionaCorFonte(String status) {
    if (status == "Dentro do Prazo") {
      return TextStyle(
        color: Colors.green[600],
      );
    } else if (status == "Prestes a Vencer") {
      return TextStyle(
        color: Colors.yellow[900],
      );
    } else if (status == "Fora do Prazo") {
      return TextStyle(
        color: Colors.red[600],
      );
    }
  }

  _selecionaCor(String status) {
    if (status == "Dentro do Prazo") {
      return Colors.green[200];
    } else if (status == "Prestes a Vencer") {
      return Colors.yellow[200];
    } else if (status == "Fora do Prazo") {
      return Colors.red[200];
    }
  }

  @override
  Widget build(BuildContext context) {
    return tarefas.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Nenhuma Tarefa Cadastrada',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 20),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: tarefas.length,
            itemBuilder: (ctx, index) {
              final tr = tarefas[index];
              return Container(
                height: 100,
                child: Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  elevation: 5,
                  color: _selecionaCor(tr.status),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              tr.titulo,
                              style: _selecionaCorFonteTitulo(tr.status),
                            ),
                            Text(
                              tr.descricao,
                              style: _selecionaCorFonte(tr.status),
                            ),
                            Text(
                              tr.status,
                              style: _selecionaCorFonte(tr.status),
                            ),
                            Text(
                              DateFormat('dd/MM/yy').format(tr.data),
                              style: _selecionaCorFonte(tr.status),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        iconSize: 25,
                        alignment: Alignment.centerRight,
                        icon: Icon(Icons.delete),
                        color: _selecionaTrashColor(tr.status),
                        onPressed: () {
                          onRemove(tr.id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            });
  }
}
