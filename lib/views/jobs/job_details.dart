import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/job.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';

class JobDetails extends StatefulWidget {
  final Job job;

  const JobDetails(this.job, {Key? key}) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title:
              Text(widget.job.intitule, style: const TextStyle(fontSize: 14)),
          centerTitle: true,
          backgroundColor: Colors.green[500]),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.job.intitule,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.job.ville))
              ]))),
      bottomNavigationBar: const AppBarWidget(2),
    );
  }
}
