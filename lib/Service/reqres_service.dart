import 'package:dio/dio.dart';

import '../Models/user_model.dart';

class ReqresService {
//GET

  Future<List<User_Model>?> fetchUser() async {
    final response = await Dio().get("https://reqres.in/api/users?page=2");

    if (response.statusCode == 200) {
      final _datas = response.data["data"];
      if (_datas is List) {
        return _datas.map((e) => User_Model.fromJson(e)).toList();
      }
    }

    return null;
  }

// POST

  Future<void> postLogin(String email, String password) async {
    try {
      final response = await Dio().post("https://reqres.in/api/login",
          data: {"email": email, "password": password});

      if (response.statusCode == 200) {
        print("OK");
        print("Token : ${response.data["token"]}");
      }
    } catch (e) {
      print(e);
    }
  }

//PUT

  Future<void> userUpdate(var email, var password) async {
    try {
      final response = await Dio().put("https://reqres.in/api/users/2",
          data: {"email": email, "password": password});

      if (response.statusCode == 200) {
        print(response.data["updatedAt"]);
      }
    } catch (e) {
      print(e);
    }
  }

  //DELETE

  Future<void> userDelete(String url) async {
    try {
      final response = await Dio().delete(url); //https://reqres.in/api/users/2

      if (response.statusCode == 204) {
        print("DELETE -> ${response.data}");
      }
    } catch (e) {
      print(e);
    }
  }
}
