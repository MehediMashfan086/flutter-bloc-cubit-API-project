import 'package:bloc_api_project/models/users_model.dart';
import 'package:http/http.dart' as http;

class UsersRepo {
  Future<List<UsersModel>> getUsers() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
    } else {
      throw Exception("Failed to load Users");
    }
  }
}
