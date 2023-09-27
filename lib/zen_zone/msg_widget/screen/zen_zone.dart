import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/zen_zone/msg_widget/other_msg_widget.dart';
import 'package:rive_animation/zen_zone/msg_widget/own_msg_widget.dart';
import 'package:rive_animation/zen_zone/msg_widget/screen/msgModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ZenZone extends StatefulWidget {
  const ZenZone({Key? key, required this.name, required this.userId})
      : super(key: key);
  final String name;
  final String userId;
  @override
  _ZenZoneState createState() => _ZenZoneState();
}

class _ZenZoneState extends State<ZenZone> {
  IO.Socket? socket;
  //final TextEditingController _messageController = TextEditingController();
  List<MsgModel> listMsg = [];
  final TextEditingController _msgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    // Replace 'http://localhost:3000' with your server URL
    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
    socket!.onConnect((_) {
      print('Connected to frontend');
      socket!.on("sendMsgServer", (msg) {
        print(msg);
        if (msg["userId"] != widget.userId) {
          setState(() {
            listMsg.add(
              MsgModel(
                  msg: msg["msg"],
                  type: msg["type"],
                  sender: msg["senderName"]),
            );
          });
        }
      });
    });
  }

  void sendMsg(String msg, String senderName) {
    MsgModel ownMsg = MsgModel(msg: msg, type: "ownMsg", sender: senderName);
    listMsg.add(ownMsg);
    setState(() {
      listMsg;
    });
    socket!.emit("sendMsg", {
      "type": "ownMsg",
      "msg": msg,
      "senderName": senderName,
      "userId": widget.userId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome to ZEN-Zone'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new), // Use the back icon here
          onPressed: () {
            // Add the action you want when the back button is pressed
            Navigator.pop(
                context); // This will navigate back to the previous page
          },
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Lottie.asset(
              'assets/LottieAssets/zen_background.json',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                child: const SizedBox(),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: listMsg.length,
                      itemBuilder: (context, index) {
                        if (listMsg[index].type == "ownMsg") {
                          return OwnMsgWidget(
                            sender: listMsg[index].sender,
                            msg: listMsg[index].msg,
                          );
                        } else {
                          return OtherMsgWidget(
                            sender: listMsg[index].sender,
                            msg: listMsg[index].msg,
                          );
                        }
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 28),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _msgController,
                            decoration: InputDecoration(
                              hintText: "Type here...",
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  String msg = _msgController.text;
                                  if (msg.isNotEmpty) {
                                    sendMsg(msg, widget.name);
                                    _msgController.clear();
                                  }
                                },
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.teal,
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class ZenZone extends StatefulWidget {
  const ZenZone({super.key, required this.name});
  final String name;

  @override
  State<ZenZone> createState() => _ZenZoneState();
}

class _ZenZoneState extends State<ZenZone> {
  IO.Socket? socket;
  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io("http://localhost:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    print("were here");
    socket!.onConnect((_) {
      print("connect");
      socket!.emit("msg", "test");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to ZEN"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 25),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Type here . . .",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 2,
                          color: const Color.fromRGBO(0, 0, 0, 0.80),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: Color(0xFFE09132),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  my handmake code RIP *FLOWER EMOJIS
}*/