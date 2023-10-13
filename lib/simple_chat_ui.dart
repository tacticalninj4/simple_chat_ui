library simple_chat_ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class SimpleChatUI {
  SimpleChatUI();

  Widget message({
    String? message,
    Image? image,
    CircleAvatar? avatar,
    GestureTapCallback? onImageTap,
    required double width,
    required DateTime time,
    required String senderID,
    required bool isMe,
    required String displayName,
    required bool isContinue,
  }) {
    if (message == null && image == null) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isMe) Expanded(child: Container()),
          if (!isMe)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: avatar,
              ),
            ),
          Container(
            padding: EdgeInsets.only(right: 4, left: 4),
            constraints: BoxConstraints(maxWidth: width),
            child: Card(
              color: isMe ? Colors.green.shade100 : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(!isMe ? 12 : 0),
                  topLeft: Radius.circular(12),
                  bottomLeft: !isContinue
                      ? Radius.circular(!isMe ? 0 : 12)
                      : Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    if (!isMe && !isContinue)
                      Text(
                        displayName,
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    SizedBox(
                      height: 4,
                    ),
                    if (image != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: onImageTap,
                          child: SizedBox(
                              width: width - 16,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image(
                                  image: image.image,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                      ),
                    if (message != null)
                      SelectableText(
                        message,
                        style: TextStyle(fontSize: 14),
                      ),
                    Text(
                      DateFormat("hh:mm").format(time),
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (!isMe) Expanded(child: Container()),
        ],
      );
    }
  }

  Widget custom({
    CircleAvatar? avatar,
    required double width,
    required Widget body,
    required DateTime time,
    required String senderID,
    required bool isMe,
    required String displayName,
    required bool isContinue,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isMe) Expanded(child: Container()),
          if (!isMe)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: avatar,
              ),
            ),
          Container(
            padding: EdgeInsets.only(right: 4, left: 4),
            constraints: BoxConstraints(maxWidth: width),
            child: Card(
              color: isMe ? Colors.green.shade100 : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(!isMe ? 12 : 0),
                  topLeft: Radius.circular(12),
                  bottomLeft: !isContinue
                      ? Radius.circular(!isMe ? 0 : 12)
                      : Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    if (!isMe && !isContinue)
                      Text(
                        displayName,
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      child: body,
                    ),
                    Text(
                      DateFormat("hh:mm").format(time),
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (!isMe) Expanded(child: Container()),
        ]);
  }
}
