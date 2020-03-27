import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  var items = List<dynamic>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: populateList,
        tooltip: 'Presso to update',
        child: Icon(Icons.cloud_download),
      ),
    );
  }

  void populateList() async {
    items.insert(0, 'LOL TEXT');
    _listKey.currentState.insertItem(0);
  }

  AnimatedList buildList() {
    return AnimatedList(
      key: _listKey,
      initialItemCount: 0,
      itemBuilder: (context, index, animation) {
        return buildTile(items[index], animation);
        // return Text(
        //   items[index],
        // );
      },
    );
  }

  Widget buildTile(String title, Animation anim) {
      return SizeTransition(
        sizeFactor: anim,
        child: Card(
          elevation: 12,
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 20,)
            )
          ),
        )
      );
  }
}
