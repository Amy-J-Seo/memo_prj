

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './write_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Row(
              children:const <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Text('Memo Memo', style: TextStyle(fontSize: 36, color: Colors.blue)),
              ),
            ]
          ),
          ...LoadMemo()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context) => WritePage()));
        },
        tooltip: 'Click to Add Memo',
        label:const Text('Add Memo'),
        icon: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

LoadMemo() {
  List<Widget> memoList =[];
  memoList.add(Container(color:Colors.purpleAccent, height:100));
  return memoList;
}
