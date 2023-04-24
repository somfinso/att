import 'dart:developer';

import 'package:http/http.dart' as http;
import 'apiconstant.dart';
import 'vegmodel.dart';

class ApiService {
  Future<List<vegmodel>?> getUsers() async {
    var u = 'http://127.0.0.1:8000/';
    try {
      // var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var url = Uri.parse(u);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<vegmodel> _model = userModelFromJson(response.body);
        print(_model);
        return _model;
      }
    } catch (e) {
      print('e');
    }
  }
}