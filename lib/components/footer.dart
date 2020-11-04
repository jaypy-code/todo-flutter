import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function deleteAll;
  Footer({this.deleteAll});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blueAccent,
      child: Row(
        children: [
          SizedBox(width: 10),
          Text(
            'Todo',
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          Tooltip(
            message: 'Delete All',
            child: IconButton(
              color: Colors.white,
              onPressed: this.deleteAll.call,
              icon: Icon(Icons.delete_forever),
            ),
          ),
          Tooltip(
            message: 'App Info',
            child: IconButton(
              color: Colors.white,
              onPressed: () => this._showInfo(context),
              icon: Icon(Icons.info_outline),
            ),
          )
        ],
      ),
    );
  }

  void _showInfo(context) {
    List<Info> items = [
      Info(title: 'App name', subtitle: 'Todo'),
      Info(title: 'App Version', subtitle: 'Beta'),
      Info(title: 'Author', subtitle: 'JayPY Code'),
      Info(title: 'License', subtitle: 'MIT License')
    ];

    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  Text(
                    'App info',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close),
                    splashRadius: 18,
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              Column(
                children: items
                    .map((item) => ListTile(
                          title: Text(
                            item.title,
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text(
                            item.subtitle,
                            style: TextStyle(fontSize: 12),
                          ),
                        ))
                    .toList(),
              )
            ]));
  }
}

class Info {
  String title;
  String subtitle;

  Info({this.title, this.subtitle});
}
