library timeline_widget;

import 'dart:math';
import 'package:flutter/material.dart';

class TimelineView extends StatefulWidget {
  List<Widget> image;
  double height;
  double width;
  double imageHeight;
  int align;
  List<Widget> children;
  Color lineColor;
  Color imageBorderColor;
  double lineWidth;

  TimelineView(
      {@required this.image,
      @required this.height,
      @required this.imageHeight,
      @required this.align,
      @required this.children,
      @required this.width,
      this.lineColor = Colors.black,
      this.imageBorderColor = Colors.black,
      this.lineWidth = 4});

  @override
  _TimelineViewState createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  @override
  void initState() {
    super.initState();
  }

  double containHeight;

  @override
  Widget build(BuildContext context) {
    containHeight = (widget.height - widget.imageHeight) / 2;

    return ListView.builder(
        itemCount: min(widget.children.length, widget.image.length),
        itemBuilder: (BuildContext ctxt, int index) {
          return new Container(
              width: widget.width,
              height: widget.height,
              child: Row(
                mainAxisAlignment: widget.align == TimelineAlign.leftAlign
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  widget.align != TimelineAlign.rightAlign
                      ? Center(
                          child: widget.children[index],
                        )
                      : SizedBox.shrink(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: widget.lineColor,
                        height: containHeight,
                        width: widget.lineWidth,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: widget.imageBorderColor),
                            borderRadius:
                                BorderRadius.circular(widget.imageHeight / 2),
                          ),
                          height: widget.imageHeight,
                          width: widget.imageHeight,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(widget.imageHeight / 2),
                            child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: widget.image[index]),
                          ),
                        ),
                      ),
                      Container(
                        color: widget.lineColor,
                        height: containHeight,
                        width: widget.lineWidth,
                      ),
                    ],
                  ),
                  widget.align != TimelineAlign.leftAlign
                      ? Center(
                          child: widget.children[index],
                        )
                      : SizedBox.shrink(),
                ],
              ));
        });
  }
}

class TimelineViewCenter extends StatefulWidget {
  List<Widget> image;
  double height;
  double imageHeight;
  List<Widget> leftChildren;
  List<Widget> rightChildren;
  Color lineColor;
  Color imageBorderColor;
  double width;
  double lineWidth;
  MainAxisAlignment horizontalAxisAlignment;

  TimelineViewCenter(
      {@required this.image,
      @required this.height,
      @required this.imageHeight,
      @required this.leftChildren,
      @required this.rightChildren,
      @required this.width,
      this.horizontalAxisAlignment = MainAxisAlignment.center,
      this.lineColor = Colors.black,
      this.imageBorderColor = Colors.black,
      this.lineWidth = 4});

  @override
  _TimelineViewCenterState createState() => _TimelineViewCenterState();
}

class _TimelineViewCenterState extends State<TimelineViewCenter> {
  @override
  void initState() {
    super.initState();
  }

  double containHeight;

  @override
  Widget build(BuildContext context) {
    containHeight = (widget.height - widget.imageHeight) / 2;

    return ListView.builder(
        itemCount: min(
            min(widget.leftChildren.length, widget.rightChildren.length),
            widget.image.length),
        itemBuilder: (BuildContext ctxt, int index) {
          return new Container(
              width: widget.width,
              height: widget.height,
              child: Row(
                mainAxisAlignment: widget.horizontalAxisAlignment,
                children: [
                  Container(
                    width: (widget.width - widget.imageHeight) / 2,
                    child: Center(child: widget.leftChildren[index]),
                  ),
                  Container(
                    width: widget.imageHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: widget.lineColor,
                          height: containHeight,
                          width: widget.lineWidth,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: widget.imageBorderColor),
                              borderRadius:
                                  BorderRadius.circular(widget.imageHeight / 2),
                            ),
                            height: widget.imageHeight,
                            width: widget.imageHeight,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(widget.imageHeight / 2),
                              child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: widget.image[index]),
                            ),
                          ),
                        ),
                        Container(
                          color: widget.lineColor,
                          height: containHeight,
                          width: widget.lineWidth,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: (widget.width - widget.imageHeight) / 2,
                      child: Center(child: widget.rightChildren[index])),
                ],
              ));
        });
  }
}

class TimelineAlign {
  static int leftAlign = 0;
  static int rightAlign = 1;
}
