import 'package:flutter/material.dart';

import 'note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: getNoteListView()),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add Note',
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return NoteDetail('Add Note');
            }));
          }),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 6.0,
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.arrow_forward_ios),
                backgroundColor: Colors.yellow,
              ),
              title: Text('Finish the project ${index + 1}'),
              subtitle: Text('Appril 4 2020'),
              trailing: Icon(Icons.delete),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return NoteDetail('Edit Note');
                }));
              },
            ),
          );
        });
  }
}
