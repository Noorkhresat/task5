import 'package:flutter/material.dart';

class AddingBottomSheet extends StatefulWidget {
  final Function(String id, String englishWord, String arabicWord) addWords;

  const AddingBottomSheet(this.addWords, {Key? key}) : super(key: key);

  @override
  _AddingBottomSheetState createState() => _AddingBottomSheetState();
}

class _AddingBottomSheetState extends State<AddingBottomSheet> {
  var _englishWordController = TextEditingController();
  var _arabichWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _englishWordController,
                decoration: InputDecoration(
                    labelText: 'English Word', hintText: 'Example'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _arabichWordController,
                decoration: InputDecoration(
                    labelText: 'Arabic Words', hintText: 'مثال'),
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.addWords(DateTime.now().toString(),
                      _englishWordController.text, _arabichWordController.text);
                },
                child: Text('Add Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
