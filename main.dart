import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dabbang',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: NaverMapTest(),
    );
  }
}

class NaverMapTest extends StatefulWidget{
  @override
  _NaverMapTestState createState() => _NaverMapTestState();
}

class _NaverMapTestState extends State<NaverMapTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NaverMap Test')),
      body: Container(
        child: NaverMap(
          onMapCreated: onMapCreated,
          mapType: _maptype,
        ),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
