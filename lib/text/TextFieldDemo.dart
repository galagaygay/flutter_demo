import 'package:flutter/material.dart';

/// Opens an [AlertDialog] showing what the user typed.
class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => new _TextFieldDemoState();
}

/// State for [ExampleWidget] widgets.
class _TextFieldDemoState extends State<TextFieldDemo> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TextField"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: _controller,
              decoration: new InputDecoration(
                hintText: 'Type something',
              ),
            ),
            new Container(
              margin: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text('What you typed'),
                      content: new Text(_controller.text),
                    ),
                  );
                },
                child: new Text('DONE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}