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

  void _toggleSearch() {
    setState(() {
      this._showSearchBox = !this._showSearchBox;
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return AppBar(
      title: _showSearchBox
          ? TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter a search term'),
            )
          : Text("Custom App Bar"),
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