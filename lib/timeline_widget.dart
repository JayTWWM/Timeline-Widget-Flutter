library timeline_view;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  ScrollController scrollController;
  Axis scrollDirection;

  TimelineView(
      {@required this.image,
      @required this.height,
      @required this.imageHeight,
      this.align = 1,
      @required this.children,
      @required this.width,
      this.scrollController,
      this.scrollDirection = Axis.vertical,
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
    if (widget.scrollController == null) {
      widget.scrollController = ScrollController();
    }
  }

  double containHeight;

  @override
  Widget build(BuildContext context) {
    if (widget.scrollDirection == Axis.vertical) {
      containHeight = (widget.height - widget.imageHeight) / 2;
      return ListView(
        scrollDirection: widget.scrollDirection,
        controller: widget.scrollController,
        children: widget.children.map((Widget child) {
          return Container(
              width: widget.width,
              height: widget.height,
              child: Row(
                mainAxisAlignment: widget.align == TimelineAlign.leftAlign
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  widget.align != TimelineAlign.rightAlign
                      ? Center(
                          child: child,
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
                                child: widget
                                    .image[widget.children.indexOf(child)]),
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
                          child: child,
                        )
                      : SizedBox.shrink(),
                ],
              ));
        }).toList(),
      );
    } else if (widget.scrollDirection == Axis.horizontal) {
      containHeight = (widget.width - widget.imageHeight) / 2;
      return ListView(
        scrollDirection: widget.scrollDirection,
        controller: widget.scrollController,
        children: widget.children.map((Widget child) {
          return Container(
              width: widget.width,
              height: widget.height,
              child: Column(
                mainAxisAlignment: widget.align == TimelineAlign.leftAlign
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  widget.align != TimelineAlign.rightAlign
                      ? Center(
                          child: child,
                        )
                      : SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: widget.lineColor,
                        width: containHeight,
                        height: widget.lineWidth,
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
                                child: widget
                                    .image[widget.children.indexOf(child)]),
                          ),
                        ),
                      ),
                      Container(
                        color: widget.lineColor,
                        width: containHeight,
                        height: widget.lineWidth,
                      ),
                    ],
                  ),
                  widget.align != TimelineAlign.leftAlign
                      ? Center(
                          child: child,
                        )
                      : SizedBox.shrink(),
                ],
              ));
        }).toList(),
      );
    }
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
  ScrollController scrollController;
  Axis scrollDirection;

  TimelineViewCenter(
      {@required this.image,
      @required this.height,
      @required this.imageHeight,
      @required this.leftChildren,
      @required this.rightChildren,
      @required this.width,
      this.scrollController,
      this.scrollDirection = Axis.vertical,
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
    if (widget.scrollController == null) {
      widget.scrollController = ScrollController();
    }
  }

  double containHeight;

  @override
  Widget build(BuildContext context) {
    if (widget.scrollDirection == Axis.vertical) {
      containHeight = (widget.height - widget.imageHeight) / 2;

      return ListView(
        scrollDirection: widget.scrollDirection,
        controller: widget.scrollController,
        children: widget.image.map((Widget imageChild) {
          return Container(
              width: widget.width,
              height: widget.height,
              child: Row(
                mainAxisAlignment: widget.horizontalAxisAlignment,
                children: [
                  Container(
                    width: (widget.width - widget.imageHeight) / 2,
                    child: Center(
                        child: widget
                            .leftChildren[widget.image.indexOf(imageChild)]),
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
                                  fit: BoxFit.fitHeight, child: imageChild),
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
                      child: Center(
                          child: widget.rightChildren[
                              widget.image.indexOf(imageChild)])),
                ],
              ));
        }).toList(),
      );
    } else if (widget.scrollDirection == Axis.horizontal) {
      containHeight = (widget.width - widget.imageHeight) / 2;

      return ListView(
        scrollDirection: widget.scrollDirection,
        controller: widget.scrollController,
        children: widget.image.map((Widget imageChild) {
          return Container(
              width: widget.width,
              height: widget.height,
              child: Column(
                mainAxisAlignment: widget.horizontalAxisAlignment,
                children: [
                  Container(
                    width: (widget.height - widget.imageHeight) / 2,
                    child: Center(
                        child: widget
                            .leftChildren[widget.image.indexOf(imageChild)]),
                  ),
                  Container(
                    height: widget.imageHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: widget.lineColor,
                          width: containHeight,
                          height: widget.lineWidth,
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
                                  fit: BoxFit.fitHeight, child: imageChild),
                            ),
                          ),
                        ),
                        Container(
                          color: widget.lineColor,
                          width: containHeight,
                          height: widget.lineWidth,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: (widget.height - widget.imageHeight) / 2,
                      child: Center(
                          child: widget.rightChildren[
                              widget.image.indexOf(imageChild)])),
                ],
              ));
        }).toList(),
      );
    }
  }
}

class TimelineAlign {
  static int leftAlign = 0;
  static int rightAlign = 1;
  static int topAlign = 1;
  static int bottomAlign = 0;
}
