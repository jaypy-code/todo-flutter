import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/components/empty.dart';
import 'package:todo/components/footer.dart';
import 'package:todo/components/item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Action> actions = [];
  TextEditingController actionInput = new TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.blueAccent, // navigation bar color
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark // status bar color
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: this.actions.length == 0
              ? Empty()
              : ListView(
                  children: this
                      .actions
                      .map((item) => Item(
                            content: item.content,
                            done: item.done,
                            toggle: (bool value) {
                              setState(() {
                                item.done = value;
                              });
                            },
                            edit: () =>
                                this._showFormAction(context, action: item),
                            delete: () {
                              setState(() {
                                actions.remove(item);
                              });
                            },
                          ))
                      .toList(),
                ),
        ),
        bottomNavigationBar: Footer(
          deleteAll: () {
            setState(() {
              this.actions = [];
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Tooltip(
          message: 'Add Action',
          child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                this._showFormAction(context);
              },
              child: Icon(Icons.add)),
        ));
  }

  void submitFormAction({Action action}) {
    setState(() {
      if (action != null)
        action.content = this.actionInput.value.text.toString();
      else
        this
            .actions
            .add(new Action(content: this.actionInput.value.text.toString()));
      this.actionInput.clear();
    });
  }

  void _showFormAction(context, {Action action}) {
    this.actionInput.clear();
    if (action != null)
      this.actionInput.value = TextEditingValue(text: action.content);
    showModalBottomSheet(
        context: context,
        builder: ((BuildContext bc) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Todo Action',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      splashRadius: 24,
                      icon: Icon(Icons.close),
                    )
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  autofocus: true,
                  controller: actionInput,
                  onFieldSubmitted: (_) {
                    this.submitFormAction(action: action);
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        this.submitFormAction(action: action);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20)
              ],
            ),
          );
        }));
  }
}

class Action {
  String content;
  bool done = false;

  Action({this.content, this.done = false});
}
