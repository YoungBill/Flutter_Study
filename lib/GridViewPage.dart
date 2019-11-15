import 'package:flutter/material.dart';
import 'package:flutter_app/mock_data.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView组件"),
      ),
      body: new _MeiTuanWidget(),
    );
  }
}

class _GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        100,
        (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline,
            ),
          );
        },
      ),
    );
  }
}

class _MeiTuanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.symmetric(vertical: 0),
      children: serviceList.map((item) => ServiceItem(data: item)).toList(),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final ServiceItemViewModel data;

  ServiceItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Expanded(child: this.data.icon),
          Text(
            this.data.title,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}
