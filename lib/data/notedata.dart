import 'package:hive/hive.dart';

class NoteDataBase {
  final _mybox = Hive.box('mybox');
  List listOfNotes = [];

// run this method if first time ever opening this app
  void createInitialData() {
    listOfNotes = [
      {
        "subject": "First Note",
        "date": "2023-05-01",
        "discription": "this is first note",
      },
    ];
  }

// load the data from the database
  void loadData() {
    listOfNotes = _mybox.get("NOTEDATA");
  }

// update database
  void updateDatabase() {
    _mybox.put("NOTEDATA", listOfNotes);
  }
}
