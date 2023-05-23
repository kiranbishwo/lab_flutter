import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NoteForm extends StatelessWidget {
  VoidCallback cancel;
  VoidCallback onSave;
  final note_controller;
  final subject_controller;
  final GlobalKey<FormState> _noteFormKey;

  NoteForm({
    Key? key,
    required this.note_controller,
    required this.subject_controller,
    required this.onSave,
    required this.cancel,
    required GlobalKey<FormState> noteFormKey,
  })  : _noteFormKey = noteFormKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Form(
          key: _noteFormKey,
          child: Container(
            height: 300,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: subject_controller,
                    validator: (msg) {
                      if (msg!.isEmpty) {
                        return "Please Enter Subject";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your subject"),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextFormField(
                    controller: note_controller,
                    validator: (msg) {
                      if (msg!.isEmpty) {
                        return "Please Enter Note";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your note"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: cancel,
                          child: Text("Cancel"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: onSave,
                          child: Text("Save"),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}
