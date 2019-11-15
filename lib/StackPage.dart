import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("StackPage组件"),
      ),
      body: new _IndexedStackPageWidget(),
    );
  }
}

class _StackPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 200,
          color: Colors.red,
        ),
        Container(
          height: 200,
          margin: EdgeInsets.all(50),
          color: Colors.green,
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 250),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/logo.png'),
            radius: 100.0,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 250),
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            'Hello',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _IndexedStackPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: 2,
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 200,
          color: Colors.red,
        ),
        Container(
          height: 200,
          margin: EdgeInsets.all(50),
          color: Colors.green,
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 250),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/logo.png'),
            radius: 100.0,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 250),
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            'Hello',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
