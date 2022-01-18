

class Memo {
  final int? id;
  final String title;
  final String text;
  final String createdTime;
  final String? editTime;

  Memo({this.id, required this.title, required this.text, required this.createdTime, this.editTime});

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'title': title,
      'text': text,
      'createdTime': createdTime,
      'editTime': editTime
    };
  }

  //toString
  @override
    String toString(){
      return 'Memo{ id: $id, title: $title, text: $text, createdTime: $createdTime, editTime: $editTime}';
  }
}
