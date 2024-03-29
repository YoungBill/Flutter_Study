import 'package:flutter/material.dart';

class RowAndColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Row和Column组件"),
      ),
      body: new _RowAndColumnWidget(),
    );
  }
}

class _RowAndColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      //整体是一个水平布局
      child: new Row(
        children: [
          //这里用Expanded的好处就是 会占用icon之外的剩余空间
          new Expanded(
              //在Expanded内创建一个垂直布局 放置两个文本
              child: new Column(
            //文本是起始端对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  "Oeschinen Lake Campground",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Text(
                "Kandersteg, Switzerland",
                style: new TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          )),
          new Icon(
            Icons.star,
            color: Colors.red,
          ),
          new Text('41')
        ],
      ),
    );

    /**
     * 抽取button行的代码复用
     */
    Column getText(IconData icon, String text) {
      return new Column(
        //聚集widgets
        mainAxisSize: MainAxisSize.min,
        //child 居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: Colors.blue[500]),
          new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(
                text,
                style: new TextStyle(
                  color: Colors.blue[500],
                ),
              ))
        ],
      );
    }

    /**
     * 实现按钮部分
     */
    Widget buttonSection = new Container(
      child: new Row(
        //MainAxisAlignment.spaceEvenly平均分配子空间  他会在每个子项之间,之前,之后平均分配空闲空间 当然也可以使用Expanded来实现
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getText(Icons.call, "CALL"),
          getText(Icons.near_me, "ROUTE"),
          getText(Icons.share, "SHARE")
        ],
      ),
    );

    /**
     * 实现文本部分
     */
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
          "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
          softWrap: true), //softWrap: true 文本是否在换行符处中断
    );

    /**
     * 9宫格
     */
    Widget gridSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Column(
        children: [
          new Row(
            //MainAxisAlignment.spaceEvenly平均分配子空间  他会在每个子项之间,之前,之后平均分配空闲空间 当然也可以使用Expanded来实现
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getText(Icons.call, "0-0"),
              getText(Icons.near_me, "0-1"),
              getText(Icons.share, "0-2")
            ],
          ),
          new Row(
            //MainAxisAlignment.spaceEvenly平均分配子空间  他会在每个子项之间,之前,之后平均分配空闲空间 当然也可以使用Expanded来实现
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getText(Icons.call, "1-0"),
              getText(Icons.near_me, "1-1"),
              getText(Icons.share, "1-2")
            ],
          ),
          new Row(
            //MainAxisAlignment.spaceEvenly平均分配子空间  他会在每个子项之间,之前,之后平均分配空闲空间 当然也可以使用Expanded来实现
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getText(Icons.call, "2-0"),
              getText(Icons.near_me, "2-1"),
              getText(Icons.share, "2-2")
            ],
          ),
        ],
      ), //softWrap: true 文本是否在换行符处中断
    );

    /**
     * 整合
     */
    return new ListView(
      children: [
        new Image.asset(
          "images/logo.png",
          width: 600.0,
          height: 240.0,
          //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonSection,
        textSection,
        gridSection,
      ],
    );
  }
}
