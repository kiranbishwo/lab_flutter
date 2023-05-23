import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  late final Function(Map<String, dynamic>) addItem;

  SecondPage({required this.addItem});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<String> options = ['Food', 'Travel', 'Health'];
  String dropdownvalue = "Food";
  // ignore: prefer_final_fields
  TextEditingController _date = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _remarks = TextEditingController();

  var _myFormKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> formArray = [];

  void handleSubmit() {
    if (_myFormKey.currentState!.validate()) {
      Map<String, dynamic> newItem = {
        'date': _date.text,
        'price': _price.text,
        'remarks': _remarks.text,
        'category': dropdownvalue
      };

      widget.addItem(newItem);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Your Expenses',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Form(
          key: _myFormKey,
          child: Column(children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Select an Category',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              ),
              // Initial Value
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: options.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(
                  () {
                    dropdownvalue = newValue!;
                  },
                );
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: TextFormField(
                controller: _price,
                validator: (msg) {
                  if (msg!.isEmpty) {
                    return "Please Enter Amount";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Amount",
                  hintText: "\$ 100",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: TextFormField(
                controller: _remarks,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: "Enter Remarks",
                  hintText: "Your Remarks",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: TextFormField(
                controller: _date,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded),
                  labelText: "Select Date",
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? pickkedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050));
                  if (pickkedDate != null) {
                    setState(() {
                      _date.text = DateFormat("yyyy-MM-dd").format(pickkedDate);
                    });
                  }
                },
                validator: (myDate) {
                  if (myDate!.isEmpty) {
                    return "Please Enter Date";
                  }
                  return null;
                },
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleSubmit,
        child: Icon(Icons.done, color: Colors.white),
      ),
    );
  }
}
