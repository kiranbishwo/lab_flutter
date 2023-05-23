import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/notedata.dart';
import 'noteform.dart';

class NotePage extends StatefulWidget {
  // const NotePage({Key? key, required this.title}) : super(key: key);

  const NotePage({super.key, required this.title});
  final String title;
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  String subject = '';
  String date = '';
  String discription = '';

  final _noteFormKey = GlobalKey<FormState>();
  final _notecontroller = TextEditingController();
  final _subjectcontroller = TextEditingController();
  List<Map<String, dynamic>> listOfNotes = [
    {
      "subject": "First Note",
      "date": "2023-05-01",
      "discription": "this is a note from me",
    },
    {
      "subject": "Second Note",
      "date": "2023-05-01",
      "discription": "this is another note from me",
    }
  ];
  void saveNewNote() {
    if (_noteFormKey.currentState!.validate()) {
      setState(() {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd')
            .format(now); // Format the date as "yyyy-MM-dd"
        Map<String, dynamic> newNote = {
          "subject": _subjectcontroller.text,
          "date": formattedDate,
          "discription": _notecontroller.text,
        };
        listOfNotes.add(newNote);
        Navigator.of(context).pop();
        _subjectcontroller.text = '';
        _notecontroller.text = '';
      });
    }
  }

  void handleNoteSubmit() {
    showDialog(
        context: context,
        builder: (context) {
          // return NoteForm(
          //   formKey: _noteFormKey,
          //   note_controller: _notecontroller,
          //   subject_controller: _subjectcontroller,
          //   onSave: saveNewNote,
          //   cancel: () => Navigator.of(context).pop(),
          // );
          return NoteForm(
            note_controller: _notecontroller,
            subject_controller: _subjectcontroller,
            onSave: saveNewNote,
            cancel: () => Navigator.of(context).pop(),
            noteFormKey: _noteFormKey,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: ListView.builder(
              itemCount: listOfNotes.length,
              itemBuilder: (context, index) {
                var item = listOfNotes[index];
                return Card(
                  color: Colors.amber.withOpacity(0.5),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['subject'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            item['date'],
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 87, 85, 85)),
                          ),
                          Divider(),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(item['discription']),
                          ),
                        ]),
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleNoteSubmit,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
