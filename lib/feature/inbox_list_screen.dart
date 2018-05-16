import 'package:flutter/material.dart';
import 'package:inbox_app/listitem/InboxListItem.dart';
import 'package:inbox_app/schema/message.dart';
import 'package:inbox_app/schema/user.dart';

class InboxListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new InboxListScreenState();
}

class InboxListScreenState extends State<InboxListScreen> {
  List<InboxListItem> _inboxList = new List();

  @override
  void initState() {
    super.initState();

    _initData();
  }

  void _initData() {
    User user;
    Message message;
    InboxListItem inboxListItem;

    setState(() {
      _inboxList.add(new InboxListItem(type: Type.TITLE, timeTitle: "Today"));

      user = new User(avatar: "assets/images/people2.jpg", name: "Yen Dang");
      message = new Message(
          user: user,
          time: "05:01 AM",
          title: "How are you?",
          content: "Hi, long time no see you",
          status: Status.NEW);

      _inboxList.add(new InboxListItem(type: Type.MESSAGE, message: message));

      user =
          new User(avatar: "assets/images/people1.jpg", name: "Flutter");
      message = new Message(
          user: user,
          time: "04:01 AM",
          title: "Hey, from Flutter",
          content: "Get new update from Flutter now",
          status: Status.READ);

      _inboxList.add(new InboxListItem(type: Type.MESSAGE, message: message));

      _inboxList
          .add(new InboxListItem(type: Type.TITLE, timeTitle: "Yesterday"));

      user =
          new User(avatar: "assets/images/people3.jpg", name: "Android");
      message = new Message(
          user: user,
          time: "03:31 PM",
          title: "Welcome to Android",
          content: "Android is updating new component",
          status: Status.READ);

      _inboxList.add(new InboxListItem(type: Type.MESSAGE, message: message));

      user =
          new User(avatar: "assets/images/people7.jpg", name: "I/O");
      message = new Message(
          user: user,
          time: "03:21 PM",
          title: "Welcome to Goolge I/O",
          content: "Get more event from I/O",
          status: Status.NEW);

      _inboxList.add(new InboxListItem(type: Type.MESSAGE, message: message));

      user =
          new User(avatar: "assets/images/people4.jpg", name: "Adam");
      message = new Message(
          user: user,
          time: "05:23 AM",
          title: "Hello",
          content: "Please help me on",
          status: Status.READ);

      _inboxList.add(new InboxListItem(type: Type.MESSAGE, message: message));

      _inboxList
          .add(new InboxListItem(type: Type.TITLE, timeTitle: "May, 12 2018"));

      user =
          new User(avatar: "assets/images/people5.jpg", name: "Hoai");
      message = new Message(
          user: user,
          time: "02:00 AM",
          title: "Caffee",
          content: "Get a coffee now",
          status: Status.READ);

      _inboxList.add(new InboxListItem(type: Type.MESSAGE, message: message));

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2.0,
        title: new Text(
          'Inbox'.toUpperCase(),
          style: new TextStyle(color: Colors.black, fontFamily: 'Arquitecta'),
        ),
      ),
      body: new ListView.builder(
          padding: new EdgeInsets.all(20.0),
          itemCount: _inboxList.length,
          itemBuilder: (context, index) {
            InboxListItem item = _inboxList[index];
            switch (item.type) {
              case Type.TITLE:
                return new HeaderItemView(item);

              case Type.MESSAGE:
                return new MessageItemView(item);
            }
          }),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        elevation: 2.0,
        child: Icon(Icons.edit),
      ),
    );
  }
}

class MessageItemView extends StatelessWidget {
  InboxListItem _data;

  MessageItemView(this._data);

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 0.2,
        color: Colors.white,
        child: new Container(
          width: double.infinity,
          padding: new EdgeInsets.all(10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: 60.0,
                height: 60.0,
                margin: new EdgeInsets.only(right: 20.0),
                child: new CircleAvatar(
                  backgroundImage: new AssetImage(_data.message.user.avatar),
                ),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Text(
                        _data.message.user.name,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: 'OpenSanBold'),
                      ),

                      new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Text(_data.message.time,
                              style: new TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontFamily: 'OpenSanRegular')),
                        ],

                      ),

                    ],
                  ),
                  new Container(
                    margin: new EdgeInsets.only(top: 15.0),
                    child: new Text(_data.message.title,
                        style: new TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontFamily: 'OpenSanBold')),
                  ),
                  new Container(
                    margin: new EdgeInsets.only(top: 10.0),
                    child: new Text(_data.message.content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: new TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontFamily: 'OpenSanRegular')),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class HeaderItemView extends StatelessWidget {
  InboxListItem _data;

  HeaderItemView(this._data);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: 18.0, bottom: 20.0),
      child: new Text(
        _data.timeTitle,
        style: new TextStyle(
            color: Colors.grey, fontSize: 18.0, fontFamily: 'OpenSanRegular'),
      ),
    );
  }
}
