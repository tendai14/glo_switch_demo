import 'dart:convert';
import 'dart:developer';

import 'package:glow_switch/data/models/data_model.dart';
import 'package:glow_switch/data/models/user_model.dart';
import 'package:glow_switch/data/models/user_response_model.dart';
import 'package:glow_switch/data/repositories/data_repository/data_provider.dart';

class DataRepository {
  final DataProvider dataProvider;
  DataRepository({required this.dataProvider});

  Future<List<DataModel>> getPosts() async {
    List data = await dataProvider.getPosts();
    // ignore: avoid_print
    print(data);
    return data.map((e) => DataModel.fromJson(e)).toList();
  }

  Future<UserResponseModel> createUser(UserModel userModel) async {
    var data = await dataProvider.createUser(userModel);
    log(data.toString());
    return UserResponseModel.fromJson(jsonDecode(data));
  }
}
