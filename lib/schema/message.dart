import 'package:inbox_app/schema/user.dart';

enum Status { NEW, READ }

class Message {
  User user;
  String time;
  String title;
  String content;
  Status status;

  Message({this.user, this.time, this.title, this.content, this.status});
}
