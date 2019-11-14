import 'package:flutter/material.dart';
import 'package:flutter_app/ImagePage.dart';
import 'package:flutter_app/TextPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> _suggestions = <String>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random(); // 删掉 ...
    //return new Text(wordPair.asPascalCase); // ... 这两行

    _suggestions.add("Text组件");
    _suggestions.add("Image组件");

    return new Scaffold(
      // 代码从这里...
      appBar: new AppBar(
        title: new Text('Flutter Demo Home Page'),
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
      case "Text组件":
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new TextPage();
        }));
        break;
      case "Image组件":
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new ImagePage();
        }));
        break;
    }
  }
}
