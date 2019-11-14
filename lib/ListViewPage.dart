import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  final List<String> _suggestions = <String>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random(); // 删掉 ...
    //return new Text(wordPair.asPascalCase); // ... 这两行

    _suggestions.add("垂直的列表");
    _suggestions.add("水平的列表");
    _suggestions.add("数据量非常大的列表");

    return new Scaffold(
      // 代码从这里...
      appBar: new AppBar(
        title: new Text('ListView组件'),
      ),
      body: _buildSuggestions(),
    ); // ... 添加到这里
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _suggestions.length * 2 - 1,

        // 对于每个建议的单词对都会调用一次 itemBuilder，
        // 然后将单词对添加到 ListTile 行中
        // 在偶数行，该函数会为单词对添加一个 ListTile row.
        // 在奇数行，该函数会添加一个分割线的 widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。

        itemBuilder: (BuildContext _context, int i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) {
            return new Divider();
          }
          final int index = i ~/ 2;
          return _buildRow(_context, _suggestions[index]);
        });
  }

  Widget _buildRow(BuildContext context, String text) {
    return new ListTile(
      title: new Text(
        text,
        style: _biggerFont,
      ),
      onTap: () {
        _pushSaved(context, text);
      },
    );
  }

  void _pushSaved(BuildContext context, String text) {
    switch (text) {
      case "垂直的列表":
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new _VListViewWidget();
        }));
        break;
      case "水平的列表":
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new _HListViewWidget();
        }));
        break;
      case "数据量非常大的列表":
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new _ListViewWidget();
        }));
        break;
    }
  }
}

class _VListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('垂直的列表'),
      ),
      body: new Center(
        child: new ListView(
          //控制方向 默认是垂直的
//          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _getContainer('Maps', Icons.map),
            _getContainer('phone', Icons.phone),
            _getContainer('Maps', Icons.map),
          ],
        ),
      ),
    );
  }

  Widget _getContainer(String test, IconData icon) {
    return new Container(
      width: 160.0,
//      ListTile
      child: new ListTile(
        leading: new Icon(icon),
        trailing: new Icon(icon),
        title: new Text(test),
        subtitle: new Text("我是subtitle"),
      ),
    );
  }
}

class _HListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('水平的列表'),
      ),
      body: new Center(
        child: new ListView(
          //控制方向 默认是垂直的
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _getContainer('Maps', Icons.map),
            _getContainer('phone', Icons.phone),
            _getContainer('Maps', Icons.map),
          ],
        ),
      ),
    );
  }

  Widget _getContainer(String test, IconData icon) {
    return new Container(
      width: 160.0,
//      ListTile
      child: new ListTile(
//       显示在title之前
        leading: new Icon(icon),
        title: new Text(test),
      ),
    );
  }
}

class _ListViewWidget extends StatelessWidget {
  final List<String> items = new List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('数据量非常大的列表'),
        ),
        body: new Center(
            child: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        )));
  }
}
