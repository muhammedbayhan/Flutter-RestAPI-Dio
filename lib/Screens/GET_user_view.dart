import 'package:flutter/material.dart';
import 'package:flutter_restapi/Models/user_model.dart';
import 'package:flutter_restapi/Service/reqres_service.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<User_Model>? _users;
  final ReqresService _reqresService = ReqresService();
  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  Future<void> fetchUser() async {
    _users = await _reqresService.fetchUser();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('(GET)'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _users?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _users?[index].firstName ?? "",
              ),
              subtitle: Text(
                _users?[index].lastName ?? "",
              ),
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                _users?[index].avatar ?? "",
              )),
              trailing: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.network(_users?[index].avatar ?? ""),
                              Icon(
                                Icons.mail,
                              ),
                              Text(_users?[index].email ?? ""),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.chevron_right)),
            );
          },
        ),
      ),
    );
  }
}
