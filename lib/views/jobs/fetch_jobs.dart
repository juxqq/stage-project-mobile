import 'package:flutter/material.dart';
import 'package:mobile_app/services/emploi_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/views/jobs/job_details.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

class fetchJobs extends StatefulWidget {
  const fetchJobs({Key? key}) : super(key: key);

  @override
  _fetchJobsState createState() => _fetchJobsState();
}

class _fetchJobsState extends State<fetchJobs> {
  final TextEditingController intituleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController? typeContratController = TextEditingController();
  final TextEditingController? remunerationController = TextEditingController();
  final EmploiService emploiService = EmploiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SearchWidget(
          searchJobsWidget(typeContratController, remunerationController, context)),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.green[500],
          title: const Text('Liste des emplois correspondants à votre recherche'),
          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08),
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
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
                  RadiusButton("Rechercher", () {

                    setState(() {});
                  }, Colors.black),
                  FutureBuilder(
                      future: emploiService.getJob(intituleController.text, locationController.text, typeContratController!.text, remunerationController!.text),

                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: const Center(
                                  child: CircularProgressIndicator()));
                        } else if (snapshot.hasData) {
                          return Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: _buildCardJob(
                                  snapshot.data as List<dynamic>));
                        } else {
                          return const Text(
                              "Nous n'avons pas trouver d'offres d'emploi qui correspondent à votre recherche.");

                        }
                      })
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
                    builder: (context) => JobDetails(data[index])));
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
                      )
                    ],
                  )));
        }));
  }
}
