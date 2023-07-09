import 'package:flutter/material.dart';
import 'package:flutter_restapi/Service/reqres_service.dart';
import 'package:flutter_restapi/Widgets/Widget_TextField.dart';

class UserDeleteView extends StatefulWidget {
  const UserDeleteView({super.key});

  @override
  State<UserDeleteView> createState() => _UserDeleteViewState();
}

class _UserDeleteViewState extends State<UserDeleteView> {
  ReqresService reqresService = ReqresService();
  TextEditingController urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "(DELETE)",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Widget_Textfield(controller: urlController, labelText: "URL"),
            ElevatedButton(
                onPressed: () {
                  reqresService.userDelete(urlController.text);
                },
                child: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
