import 'package:flutter/material.dart';

class ListTitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListTitle组件"),
      ),
      body: new _ListTitleWidget(),
    );
  }
}

class _ListTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Card(
      child: new ListTile(
          title: new Text("duo_shine"),
          subtitle: new Text("duo_shine@163.com"),
          //之前显示icon
          leading: new Icon(Icons.email, color: Colors.blueAccent),
          //之后显示checkBox
          trailing: new Image.asset(
            "images/logo.png",
          )),
    );
  }
}
