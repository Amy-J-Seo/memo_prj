import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memo_prj/database/db_curd.dart';
import '../database/data_form.dart';
import '../database/db_curd.dart';

class WritePage extends StatelessWidget {
  String title='';
  String text='';

  WritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.delete)),
          IconButton(
              onPressed: saveDB,
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String title){ this.title = title;},
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration( hintText:'Write Memo title')
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              onChanged: (String text){ this.text = text;},
              keyboardType: TextInputType.multiline,
              maxLength: null,
              decoration: const InputDecoration(
                hintText: 'Enter your memo'
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async{
    DBHelper sd = DBHelper();

print('saveBtn clicked');
     var newMemo = Memo(
       id:3,
       title:title,
       text:text,
       createdTime: DateTime.now().toString(),
       editTime:DateTime.now().toString(),
     );

     print(newMemo.toString());
     await sd.insertMemo(newMemo);

     print(await sd.getTotalListMemo());
  }
}