import 'dart:convert';

import 'package:hello_world/util/result.dart';
import 'package:http/http.dart' as http;

class Source {
  Future<Result<Map<String, dynamic>>> getUserById(int id) async {
    try {
      var response = await http.get(
        Uri.parse('https://koreanjson.com/users/$id'),
      );

      // ~/ : 몫
      if (response.statusCode ~/ 100 == 2) {
        Map<String, dynamic> json = jsonDecode(response.body);

        return Result.success(json);
      } else {
        throw Exception('GetUserListError: not 200 status code');
      }
    } catch (e) {
      return Result.error("GetUserListError: $e");
    }
  }

  Future<Result<List<dynamic>>> getUserList() async {
    try {
      var response = await http.get(
        Uri.parse('https://koreanjson.com/users'),
      );

      // ~/ : 몫
      if (response.statusCode ~/ 100 == 2) {
        List<dynamic> json = jsonDecode(response.body);
        return Result.success(json);
      } else {
        throw Exception('GetUserListError: not 200 status code');
      }
    } catch (e) {
      return Result.error("GetUserListError: $e");
    }
  }
}