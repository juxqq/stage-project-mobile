import 'package:flutter/material.dart';
import 'package:mobile_app/services/event_service.dart';
import 'package:mobile_app/views/jobs/job_details.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

import 'edit_event.dart';
import 'event_details.dart';

class fetchEvent extends StatefulWidget {
  const fetchEvent({Key? key}) : super(key: key);

  @override
  _fetchEventState createState() => _fetchEventState();
}

class _fetchEventState extends State<fetchEvent> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final EventService eventService = EventService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text("Rechercher un évènement",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  TextForm(nomController, 'Quoi', (value) {}, Icons.search,
                      false, () {}, TextInputType.text),
                  const SizedBox(width: 10),
                  TextForm(
                      locationController,
                      'Où',
                          (value) {},
                      Icons.location_on_sharp,
                      false,
                          () {},
                      TextInputType.text),
                  const SizedBox(width: 20),
                  RadiusButton("Rechercher", () {
                    setState(() {
                    });
                  }, Colors.black),
                  FutureBuilder(
                      future: eventService.getEvent(nomController.text, locationController.text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: const Center(child: CircularProgressIndicator()));
                        } else if (snapshot.hasData) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: _buildCardJob(snapshot.data as List<dynamic>));
                        } else {
                          return const Text("Nous n'avons pas trouver d'évènements qui correspondent à votre recherche.");
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppBarWidget(),
    );
  }
  _buildCardJob(data) {
    return Column(
        children: List.generate(data.length, (index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EventDetails(data[index])));
              },
              child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10.0),
                          top: Radius.circular(2.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(data[index].intitule),
                        leading: const Icon(Icons.article),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        subtitle: Text(data[index].loc),
                        leading: const Icon(Icons.location_on_sharp),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RadiusButton("Modifier un évément", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditEvent(data[index])),
                        );
                      }, Colors.black)
                    ],
                  )));
        }));
  }
}
