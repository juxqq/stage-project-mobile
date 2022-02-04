import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/radius_button.dart';

class AcceuilProfil extends StatefulWidget {
  const AcceuilProfil({Key? key}) : super(key: key);

  String? get title => null;

  @override
  _AcceuilProfilState createState() => _AcceuilProfilState();
}

class _AcceuilProfilState extends State<AcceuilProfil> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 70,
                    backgroundImage:
                        Image.asset('assets/img/creatingprofile.png').image,
                  ),
                  const Text(
                    'Giroud Cyrille',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Container(
              decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Color(0xFF7F7F7F)),
            ),
            color: Colors.grey,
          )),
          Column(
              children: List.generate(buttons.length, (index) {
            return ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      buttons[index]['icon'],
                      color: Colors.black,
                    ),
                    const SizedBox(width: 15),
                    Text(buttons[index]['name'],
                        style: const TextStyle(color: Colors.black))
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 30),
                    primary: Colors.white,
                    elevation: 0));
          })),
        ],
      ),
      bottomNavigationBar: const AppBarWidget(),
    ));
  }
}
