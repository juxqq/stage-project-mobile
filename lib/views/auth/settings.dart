import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/controller/user_controller.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';

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
      body: FutureBuilder(
          future: UserController.user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              var _user = snapshot.data as User;
              return Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 60,
                              backgroundImage: _user.image),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${_user.name} ${_user.firstName}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                        onPressed: () {
                          Navigator.of(context).pushNamed('/main');
                        },
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
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 30),
                            primary: Colors.white,
                            elevation: 0));
                  })),
                ],
              );
            } else {
              return Center(child: Text('Impossible de charger les données.'));
            }
          }),
      bottomNavigationBar: const AppBarWidget(),
    ));
  }
}
