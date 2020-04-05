import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  final appBarTitle;
  //Constructor
  NoteDetail(this.appBarTitle);

  @override
  _NoteDetailState createState() => _NoteDetailState(this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
  final appBarTitle;
  List<String> priorities;
  String itemSelected;
  TextEditingController titleController, descriptionController;
  var formKey;
  //Constructor
  _NoteDetailState(this.appBarTitle);

  @override
  void initState() {
    this.priorities = ['High', 'Low'];
    this.itemSelected = this.priorities[0];
    this.titleController = TextEditingController();
    this.descriptionController = TextEditingController();
    this.formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.appBarTitle),
      ),
      body: getNoteDetail(),
    );
  }

  ListView getNoteDetail() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      children: <Widget>[
        ListTile(
          title: DropdownButton<String>(
            items: this.priorities.map((String item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: (theChosenOne) {
              setState(() {
                this.itemSelected = theChosenOne;
              });
            },
            value: this.itemSelected,
          ),
        ),
        Form(
          key: formKey,
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: this.titleController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter the title';
                  }
                    return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Description',
                  helperText: 'Option',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: this.descriptionController,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                            color: Colors.green,
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                            onPressed: () {
                              if(this.formKey.currentState.validate()){
                                print('Submitting the form ....');
                              }
                            })),
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                    ),
                    Expanded(
                        child: RaisedButton(
                            color: Colors.redAccent,
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                this.titleController.text = '';
                                this.descriptionController.text = '';
                                this.itemSelected = this.priorities[0];
                              });
                            }))
                  ],
                ))
          ],
        ))
      ],
    );
  }

}
