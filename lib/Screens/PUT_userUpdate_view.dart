import 'package:flutter/material.dart';
import 'package:flutter_restapi/Service/reqres_service.dart';
import 'package:flutter_restapi/Widgets/Widget_TextField.dart';

class UserUpdateView extends StatefulWidget {
  const UserUpdateView({super.key});

  @override
  State<UserUpdateView> createState() => _UserUpdateViewState();
}

class _UserUpdateViewState extends State<UserUpdateView> {
  ReqresService _reqresService = ReqresService();

  TextEditingController _updateMailController = TextEditingController();
  TextEditingController _updatePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("(PUT-UPDATE)"),
          backgroundColor: Colors.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Widget_Textfield(
                  controller: _updateMailController,
                  labelText: "Email (eve.holt@reqres.in)"),
              Widget_Textfield(
                  controller: _updatePasswordController,
                  labelText: "Password (cityslicka)"),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    if (_updateMailController.text.isNotEmpty &&
                        _updatePasswordController.text.isNotEmpty) {
                      _reqresService.userUpdate(_updateMailController.text,
                          _updatePasswordController.text);
                    }
                  },
                  child: Icon(Icons.update))
            ],
          ),
        ));
  }
}
