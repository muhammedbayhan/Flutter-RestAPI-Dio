import 'package:flutter/material.dart';
import 'package:flutter_restapi/Screens/DELETE_userDelete_view.dart';
import 'package:flutter_restapi/Screens/GET_user_view.dart';
import 'package:flutter_restapi/Screens/POST_login_view.dart';
import 'package:flutter_restapi/Screens/PUT_userUpdate_view.dart';

import '../Widgets/Widget_CardButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget_CardButton(
                  text: "GET",
                  icon: Icons.list_alt_sharp,
                  color: Colors.green,
                  widget: UserView()),
              Widget_CardButton(
                  text: "POST",
                  icon: Icons.post_add,
                  color: Colors.blue,
                  widget: LoginView()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget_CardButton(
                  text: "UPDATE",
                  icon: Icons.update,
                  color: Colors.orange,
                  widget: UserUpdateView()),
              Widget_CardButton(
                  text: "DELETE",
                  icon: Icons.delete,
                  color: Colors.red,
                  widget: UserDeleteView()),
            ],
          )
        ],
      ),
    );
  }
}
