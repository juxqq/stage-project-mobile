
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/event.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';


class EventDetails extends StatefulWidget {
  final Event event;

  const EventDetails(this.event, {Key? key}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title:
          Text(widget.event.nom, style: const TextStyle(fontSize: 14)),
          centerTitle: true,
          backgroundColor: Colors.green[500]),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.event.nom,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.event.loc))
              ]))),
      bottomNavigationBar: const AppBarWidget(),
    );
  }
}
