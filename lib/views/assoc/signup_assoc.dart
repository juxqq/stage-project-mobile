import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/services/assoc_service.dart';
import 'package:mobile_app/share/radius_button.dart';

class SignUpAssoc extends StatefulWidget {
  const SignUpAssoc({Key? key}) : super(key: key);

  @override
  _SignUpAssocState createState() => _SignUpAssocState();
}

class _SignUpAssocState extends State<SignUpAssoc> {
  String dropdownValue = '1-10';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController siretController = TextEditingController();
  final TextEditingController presidentController = TextEditingController();
  final TextEditingController tresorierController = TextEditingController();
  final TextEditingController secretaireController = TextEditingController();
  final TextEditingController localisationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController siteWebController = TextEditingController();
  final AssocService assocService = AssocService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Formulaire inscription",
                style: TextStyle(fontSize: 25)),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 60,
              ),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: "Nom de l'association",
                    icon: Icon(Icons.business)),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 60,
              ),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: siretController,
                validator: (value) {
                  return value!.validateSiret();
                },
                decoration: InputDecoration(
                  labelText: "N° Siret",
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 60,
              ),
              child: TextFormField(
                controller: presidentController,
                validator: (value) {
                  return value!.validateLastName();
                },
                decoration: InputDecoration(
                    labelText: "Nom complet du Président",
                    icon: Icon(Icons.hail)),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 60,
              ),
              child: TextFormField(
                controller: tresorierController,
                validator: (value) {
                  return value!.validateLastName();
                },
                decoration: InputDecoration(
                    labelText: "Nom complet du Trésorier",
                    icon: Icon(Icons.price_check)),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 60,
              ),
              child: TextFormField(
                controller: secretaireController,
                validator: (value) {
                  return value!.validateLastName();
                },
                decoration: InputDecoration(
                    labelText: "Nom complet du Secrétaire",
                    icon: Icon(Icons.assistant)),
              ),
            ),
            const SizedBox(height: 25),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  left: 40,
                  right: 60,
                ),
                child: Row(
                  children: [
                    Icon(Icons.format_list_numbered, color: Colors.grey),
                    const SizedBox(width: 20),
                    _buildDropButton()
                  ],
                )),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 60,
              ),
              child: TextFormField(
                controller: localisationController,
                decoration: InputDecoration(
                    labelText: "Localisation", icon: Icon(Icons.location_on)),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 60,
              ),
              child: TextFormField(
                controller: descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    labelText: "Description", icon: Icon(Icons.text_fields)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 60,
              ),
              child: TextFormField(
                controller: mailController,
                validator: (value) {
                  return value!.validateEmail();
                },
                decoration:
                    InputDecoration(labelText: "Email", icon: Icon(Icons.mail)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 60,
              ),
              child: TextFormField(
                controller: siteWebController,
                validator: (value) {
                  return value!.validateEmail();
                },
                decoration: InputDecoration(
                    labelText: "Site web", icon: Icon(Icons.add_link)),
              ),
            ),
            RadiusButton("S'inscrire", () async {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Inscription en cours...')),
                );
                await assocService
                    .createAssoc(
                        nameController.text,
                        siretController.text,
                        presidentController.text,
                        tresorierController.text,
                        secretaireController.text,
                        dropdownValue,
                        localisationController.text,
                        descriptionController.text,
                        mailController.text,
                        siteWebController.text)
                    .then((value) {
                  if (value == true) {
                    Navigator.pushNamed(context, '/main');
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Inscription réussie !'),
                        backgroundColor: Colors.green));
                  }
                });
              }
            }, Colors.lightBlue),
          ],
        )),
      ),
    );
  }

  Widget _buildDropButton() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['1-10', '+20', '+50', '+100']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
