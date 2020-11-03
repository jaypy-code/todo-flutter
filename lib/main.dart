import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Action> actions = [];
  TextEditingController actionInput = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 11,
                        child: Text(
                          'Your todo list',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.delete_forever),
                          splashRadius: 24,
                          onPressed: () {
                            actions.length == 0
                                // ignore: unnecessary_statements
                                ? null
                                : setState(() {
                                    actions = [];
                                  });
                          })
                    ]),
              ),
              SizedBox(height: 10),
              Expanded(
                child: actions.length == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Notings to do! please add new action.'),
                      )
                    : ListView(
                        children: actions
                            .map((item) => ListTile(
                                trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    splashRadius: 24,
                                    onPressed: () {
                                      setState(() {
                                        actions.remove(item);
                                      });
                                    }),
                                leading: Checkbox(
                                    activeColor: Colors.green,
                                    value: item.done,
                                    onChanged: (bool value) {
                                      setState(() {
                                        item.done = value;
                                      });
                                    }),
                                title: Text(
                                  item.content,
                                  style: TextStyle(
                                      decoration: item.done
                                          ? TextDecoration.lineThrough
                                          : null),
                                )))
                            .toList()),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: TextFormField(
                    controller: actionInput,
                    onFieldSubmitted: (value) {
                      actionInput.clear();
                      setState(() {
                        actions.add(Action(content: value));
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Your action',
                      border: OutlineInputBorder(),
                    )),
              )
            ],
          )),
    );
  }
}

class Action {
  String content;
  bool done = false;

  Action({this.content, this.done = false});
}
