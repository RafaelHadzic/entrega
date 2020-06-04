import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_text_field.dart';
import 'adaptative_date_picker.dart';

class FormularioTarefa extends StatefulWidget {
  final void Function(String, String, DateTime, String) onSubmit;

  FormularioTarefa(this.onSubmit);

  @override
  _TarefaFormState createState() => _TarefaFormState();
}

class _TarefaFormState extends State<FormularioTarefa> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _statusController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final titulo = _titleController.text;
    final descricao = _descController.text;
    final status = _statusController.text;

    if (titulo.isEmpty || _selectedDate == null) {
      return;
    }

    widget.onSubmit(titulo, descricao, _selectedDate, status);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                label: "Título",
              ),
              AdaptativeTextField(
                label: "Descrição",
                controller: _descController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextField(
                label: "Status",
                controller: _statusController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate){
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova Tarefa',
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
