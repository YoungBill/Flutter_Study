import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Container组件"),
      ),
      body: new _ContainerWidget(),
    );
  }
}

class _ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Wrap(children: <Widget>[
      new Container(
        constraints: new BoxConstraints.expand(
          height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
        ),
        decoration: new BoxDecoration(
          border: new Border.all(width: 2.0, color: Colors.red),
          color: Colors.green,
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          image: new DecorationImage(
            image: new NetworkImage(
                'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: new Text('Hello World',
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.black)),
        transform: new Matrix4.rotationZ(0.3),
      ),
      new Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 105,
          right: 20,
        ),
        child: new _RoundButton(
          title: new Text(
            "默认按钮",
            style: new TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPress: () {
            print("你点了默认按钮");
          },
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
        ),
        child: new _RoundButton(
          title: new Text(
            "红绿按钮",
            style: new TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.red,
          activeBackgroundColor: Colors.green,
          onPress: () {
            print("你点了红绿按钮");
          },
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
        ),
        child: new _RoundButton(
          title: new Text(
            "Disabled按钮",
            style: new TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.grey,
          activeBackgroundColor: Colors.green,
          enable: false,
          onPress: () {
            print("你点了Disabled按钮");
          },
        ),
      ),
    ]));
  }
}

class _AStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(50),
      color: Colors.blue,
      child: new Text(
        "点我啊",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class _AStatefulWidget extends StatefulWidget {
  @override
  _AStatefulWidgetState createState() {
    return new _AStatefulWidgetState();
  }
}

class _AStatefulWidgetState extends State<_AStatefulWidget> {
  Color _currentColor;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          _currentColor = Colors.red;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          _currentColor = Colors.green;
        });
      },
      onTapCancel: () {
        setState(() {
          _currentColor = Colors.green;
        });
      },
      child: new Container(
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.all(50),
        color: _currentColor,
        child: new Text(
          "点我啊",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class _RoundButton extends StatefulWidget {
  static const defaultBackgroundColor = const Color(0xFF8B5FFE);
  static const defaultActiveBackgroundColor = const Color(0xB38B5FFE);
  static const defaultDisabledBackgroundColor = const Color(0x338B5FFE);

  _RoundButton({
    this.title,
    this.onPress,
    this.height = 52.0,
    this.width = double.infinity,
    this.enable = true,
    this.backgroundColor = defaultBackgroundColor,
    this.activeBackgroundColor = defaultActiveBackgroundColor,
    this.disabledBackgroundColor = defaultDisabledBackgroundColor,
  });

  final Widget title;
  final Color backgroundColor, activeBackgroundColor, disabledBackgroundColor;
  final VoidCallback onPress;
  final double height, width;
  final bool enable;

  @override
  State<StatefulWidget> createState() {
    return new _RoundButtonState();
  }
}

class _RoundButtonState extends State<_RoundButton> {
  Color _currentColor;

  @override
  void initState() {
    super.initState();
    if (widget.enable) {
      _currentColor = widget.backgroundColor;
    } else {
      _currentColor = widget.disabledBackgroundColor;
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    _currentColor = widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        if (widget.onPress != null && widget.enable) {
          widget.onPress();
        }
      },
      onTapDown: (TapDownDetails details) {
        if (widget.enable) {
          setState(() {
            _currentColor = widget.activeBackgroundColor;
          });
        }
      },
      onTapUp: (TapUpDetails details) {
        if (widget.enable) {
          setState(() {
            _currentColor = widget.backgroundColor;
          });
        }
      },
      onTapCancel: () {
        if (widget.enable) {
          setState(() {
            _currentColor = widget.backgroundColor;
          });
        }
      },
      child: new Container(
        decoration: new BoxDecoration(
          color: _currentColor,
          borderRadius:
              new BorderRadius.all(new Radius.circular(widget.height / 2.0)),
        ),
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        child: widget.title,
      ),
    );
  }
}
