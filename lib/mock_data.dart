import 'package:flutter/material.dart';

class ServiceItemViewModel {
  /// 图标
  final Icon icon;

  /// 标题
  final String title;

  const ServiceItemViewModel({
    this.icon,
    this.title,
  });
}

/// 美团 - 服务菜单
const List<ServiceItemViewModel> serviceList = [
  ServiceItemViewModel(
    title: '精选早餐',
    icon: Icon(
      Icons.free_breakfast,
      size: 25,
      color: Colors.lightBlue,
    ),
  ),
  ServiceItemViewModel(
    title: '包子',
    icon: Icon(
      Icons.ac_unit,
      size: 25,
      color: Colors.orangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '炸鸡',
    icon: Icon(
      Icons.email,
      size: 29,
      color: Colors.deepOrangeAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '网红甜品',
    icon: Icon(
      Icons.print,
      size: 30,
      color: Colors.pinkAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '湘菜',
    icon: Icon(
      Icons.record_voice_over,
      size: 20,
      color: Colors.redAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '减免配送费',
    icon: Icon(
      Icons.add_to_home_screen,
      size: 25,
      color: Colors.orange,
    ),
  ),
  ServiceItemViewModel(
    title: '美团专送',
    icon: Icon(
      Icons.accessibility_new,
      size: 28,
      color: Colors.blueAccent,
    ),
  ),
  ServiceItemViewModel(
    title: '到点自取',
    icon: Icon(
      Icons.shop,
      size: 25,
      color: Colors.lightGreen,
    ),
  ),
  ServiceItemViewModel(
    title: '跑腿代购',
    icon: Icon(
      Icons.airplanemode_active,
      size: 25,
      color: Colors.red,
    ),
  ),
  ServiceItemViewModel(
    title: '全部分类',
    icon: Icon(
      Icons.local_mall,
      size: 25,
      color: Colors.amber,
    ),
  ),
];
