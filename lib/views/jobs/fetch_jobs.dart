import 'package:flutter/material.dart';
import 'package:mobile_app/share/radius_button.dart';
import 'package:mobile_app/share/text_form.dart';
import 'package:mobile_app/services/emploi_service.dart';

class fetchJobs extends StatefulWidget {
  const fetchJobs({Key? key}) : super(key: key);

  @override
  _fetchJobsState createState() => _fetchJobsState();
}

class _fetchJobsState extends State<fetchJobs> {
  final TextEditingController intituleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final EmploiService emploiService = EmploiService();

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
                  const Text("Rechercher une annonce d'emploi",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  TextForm(intituleController, 'Quoi', (value) {}, Icons.search,
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
                  RadiusButton("Recherher", () async {
                    await emploiService.getJob(
                        intituleController.text, locationController.text);
                    for (int i = 0; i < json.length; i++) {}
                  }, Colors.black)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
