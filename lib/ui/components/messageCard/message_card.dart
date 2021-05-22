import 'package:cs310insta/utils/color.dart';
import 'package:flutter/material.dart';
import '../../../core/models/cardModel.dart';
import '../../../utils/shapes.dart';

class MessageCard extends StatelessWidget {
  final MessageModel messageFields;
  final String myname;
  MessageCard({this.messageFields, this.myname});
  Paint painter;
  @override
  Widget build(BuildContext context) {
    if (this.messageFields.from != this.myname) {
      return MessageCardGeneric(
        mainaxisallignment: MainAxisAlignment.start,
        crossaxisallignment: CrossAxisAlignment.start,
        myTriange: DrawTriangleShapeLeft(color: Colors.amber),
        myBorderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        messageFields: messageFields,
      );
    } else {
      return MessageCardGeneric(
        mainaxisallignment: MainAxisAlignment.end,
        crossaxisallignment: CrossAxisAlignment.end,
        myTriange: DrawTriangleShapeRight(color: Colors.amber),
        myBorderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
        messageFields: messageFields,
      );
    }
  }
}

class MessageCardGeneric extends StatelessWidget {
  final MessageModel messageFields;
  final MainAxisAlignment mainaxisallignment;
  final CrossAxisAlignment crossaxisallignment;
  final CustomPainter myTriange;
  final BorderRadius myBorderRadius;

  MessageCardGeneric({
    this.mainaxisallignment,
    this.crossaxisallignment,
    this.myTriange,
    this.myBorderRadius,
    this.messageFields,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: this.mainaxisallignment,
        children: [
          Container(
            width: 280,
            child: Column(
              crossAxisAlignment: this.crossaxisallignment,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("${this.messageFields.message}"),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: this.myBorderRadius,
                    color: Colors.amber,
                  ),
                ),
                CustomPaint(size: Size(20, 20), painter: this.myTriange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
