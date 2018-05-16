import 'package:inbox_app/schema/message.dart';

enum Type { TITLE, MESSAGE }

class InboxListItem {

  Message message;
  Type type;
  String timeTitle;

  InboxListItem({this.message, this.type, this.timeTitle});

}
