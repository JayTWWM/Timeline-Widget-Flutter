library timeline_view;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TimelineView extends StatefulWidget {
  /// List of images
  final List<Widget> image;

  /// Height of a list item
  final double height;

  /// Width of a list item
  final double width;

  /// Height of the image
  final double imageHeight;

  /// Alignment of the timeline eg: TimelineAlign.Right
  final int align;

  /// List of children widgets
  final List<Widget> children;

  /// Colour of timeline
  final Color lineColor;

  /// Color of image boreder
  final Color imageBorderColor;

  /// Width of timeline
  final double lineWidth;

  /// ScrollController
  final ScrollController scrollController;

  /// Axis Direction
  final Axis scrollDirection;

  TimelineView(
      {@required this.image,
      @required this.height,
      @required this.imageHeight,
      this.align = 1,
      @required this.children,
      @required this.width,
      @required this.scrollController,
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
    } else {
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
  /// List of images in timeline
  final List<Widget> image;

  /// Height of children widget
  final double height;

  /// Height of image
  final double imageHeight;

  /// List of left children widgets
  final List<Widget> leftChildren;

  /// List of right children widgets
  final List<Widget> rightChildren;

  /// Color of timeline
  final Color lineColor;

  /// Image Border Color
  final Color imageBorderColor;

  /// Width of children widget
  final double width;

  /// Width of timeline
  final double lineWidth;

  /// Main AxisAlignment of row
  final MainAxisAlignment horizontalAxisAlignment;

  /// ScrollController
  final ScrollController scrollController;

  /// Axis Direction
  final Axis scrollDirection;

  TimelineViewCenter(
      {@required this.image,
      @required this.height,
      @required this.imageHeight,
      @required this.leftChildren,
      @required this.rightChildren,
      @required this.width,
      @required this.scrollController,
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
    } else {
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
