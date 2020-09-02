import 'package:flutter/material.dart';
//https://dribbble.com/shots/1881354-Search-Bar-Animation

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _showSearchBox = false;

  Widget _getMainBuilder() {
    if (!_showSearchBox) {
      return Row(
        children: [
          Expanded(
            child: AnimatedOpacity(
              opacity: _showSearchBox ? 0.0 : 1,
              duration: Duration(milliseconds: 100),
              child: Text("Regular App Bar"),
            ),
          )
        ],
      );
    } else {
      return TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            isDense: true,
            hintMaxLines: 1,
            enabled: true,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintStyle: TextStyle(color: Color.fromARGB(200, 255, 255, 255)),
            hintText: 'Search...'),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void _toggleSearch() {
    setState(() {
      this._showSearchBox = !this._showSearchBox;
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return AppBar(
      centerTitle: false,
      title: Column(
        children: [
          Container(
            height: 56,
            alignment: Alignment.centerLeft,
            child: ClipRect(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeOutSine,
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    child: child,
                    position:
                        Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                            .animate(animation),
                  ),
                ),
                child: _getMainBuilder(),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: _showSearchBox
              ? const Icon(Icons.close)
              : const Icon(Icons.search),
          tooltip: 'Show Snackbar',
          onPressed: () {
            _toggleSearch();
          },
        ),
      ],
    );
  }
}
