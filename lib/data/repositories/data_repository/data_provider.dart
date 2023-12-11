import 'dart:convert';

import 'package:glow_switch/data/models/user_model.dart';
import 'package:glow_switch/res/app_urls.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  Future getPosts() async {
    var response = await http.get(Uri.parse(AppUrls.baseUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to get Posts ${response.statusCode}');
    }
    // ignore: avoid_print
    print(jsonDecode(response.body));

    return jsonDecode(response.body);
  }

  Future createUser(UserModel userModel) async {
    var requestBody = jsonEncode(userModel.toJson());
    var headers = {'Content-Type': 'application/json'};

    var response = await http.post(
        Uri.parse('${AppUrls.gloBaseUrl}/wallet/create'),
        body: requestBody,
        headers: headers);

    // ignore: avoid_print
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Failed to Create Account!! ${response.body}');
    } else {
      return response.body;
    }
  }
}
