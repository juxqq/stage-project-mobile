import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  late User user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    var data = await UserService.getUserId();
    user = User.fromJson(data);

    if (data != null) {
      nameController.text = data['name'];
      firstNameController.text = data['firstName'];
      mailController.text = data['mail'];
      phoneController.text = data['phone'];
    }
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
