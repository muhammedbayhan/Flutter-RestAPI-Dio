import 'package:flutter/material.dart';
import 'package:flutter_restapi/Service/reqres_service.dart';

import '../Widgets/Widget_TextField.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ReqresService _reqresService = ReqresService();
  String? token;
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("(POST)"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Widget_Textfield(
              controller: _mailController,
              labelText: "Email (eve.holt@reqres.in)",
            ),
            Widget_Textfield(
              controller: _passwordontroller,
              labelText: "Password (cityslicka)",
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (_mailController.text.isNotEmpty &&
                      _passwordontroller.text.isNotEmpty) {
                    _reqresService.postLogin(
                        _mailController.text, _passwordontroller.text);
                  }
                },
                child: Text('Login')),
            Text(token ?? "")
          ],
        ),
      ),
    );
  }
}
