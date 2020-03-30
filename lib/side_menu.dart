library side_menu;

import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  final Color backgroundColor;
  final double screenWidth;
  final Widget buttonClosed;
  final Widget buttonExpanded;
  final Widget bodyWidget;

  const SideMenu(
      {Key key,
      this.backgroundColor,
      this.screenWidth,
      this.buttonClosed,
      this.buttonExpanded,
      this.bodyWidget})
      : super(key: key);
  @override
  _SideMenuState createState() =>
      _SideMenuState();
}

class _SideMenuState extends State<SideMenu>
    with SingleTickerProviderStateMixin {
  double maxWidth;
  double buttonSize = 34;
  double minWidth = 0;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  Widget buttonWidget;
  Widget bodyWidget;

  @override
  void initState() {
    super.initState();

    maxWidth = widget.screenWidth - buttonSize;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Container(
                  width: buttonSize,
                  color: Colors.transparent,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isCollapsed = !isCollapsed;
                            isCollapsed
                                ? _animationController.forward()
                                : _animationController.reverse();
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 20.0,
                            ),
                            child: isCollapsed
                                ? widget.buttonClosed
                                : widget.buttonExpanded),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  width: widthAnimation.value,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                  ),
                  child: widget.bodyWidget),
            ],
          );
        });
  }
}
