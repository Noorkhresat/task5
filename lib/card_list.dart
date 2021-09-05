import 'package:flutter/material.dart';
import 'package:task5/adding_sheet.dart';
import 'package:task5/my_card.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<Words> wordsList = [
    Words('1', 'Wool', 'صوف'),
    Words('2', 'Cotton', 'قطن'),
    Words('3', 'Silk', 'حرير'),
    Words('4', 'Lather', 'جلد'),
  ];

  void openSheet() {
    showModalBottomSheet(
      context: context,
      builder: (cons) {
        return AddingBottomSheet(addWords);
      },
    );
  }

  void deleteWords(String id) {
    wordsList.removeWhere((element) => element.id == id);
  }

  void addWords(String id, String englishWord, String arabicWord) {
    setState(() {
      wordsList.add(
        Words(id, englishWord, arabicWord),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
        appBar: AppBar(
          title: Text('My word'),
        ),
        body: wordsList.length == 0
            ? Center(
                child: Text('There no item yet'),
              )
            : ListView.builder(
                itemCount: wordsList.length,
                itemBuilder: (cons, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${++count}'),
                      ),
                      title: Text('${wordsList[index].englishWord}'),
                      subtitle: Text('${wordsList[index].arabicWord}'),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            deleteWords(wordsList[index].id);
                          });
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: openSheet,
          child: Icon(
            Icons.add,
            color: Colors.purple,
          ),
        ));
  }
}
