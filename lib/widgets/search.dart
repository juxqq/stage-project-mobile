import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final List<dynamic> widgets;
  const SearchWidget(this.widgets, {Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: widget.widgets.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        widget.widgets[index],
                        const SizedBox(height: 10),
                      ]);
                    }))));
  }
}