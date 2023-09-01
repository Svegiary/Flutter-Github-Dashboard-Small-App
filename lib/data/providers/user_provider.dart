// This is the data provider for a GitHub user
// Here you will find the ray API calls

import 'dart:developer';

import 'package:http/http.dart' as http;

class UserAPI {
  final String username;

  UserAPI({required this.username});

  Future<http.Response?> getUserInfo() async {
    //If the response fails , return a null value so that the
    // cubit can handle the UI accordingly
    try {
      var url = Uri.parse('https://api.github.com/users/$username');
      var response = await http.get(url);
      return response;
    } catch (e) {
      log('An error occurred during the request: $e'); //log the error
      return null;
    }
  }

  Future<http.Response> getUserRepos() async {
    try {
      var url = Uri.parse('https://api.github.com/users/$username/repos');
      var response = await http.get(url);
      return response;
    } catch (e) {
      log('An error occurred during the request: $e');
      throw Exception('HTTPs request failed: $e');
    }
  }

  Future<http.Response> getUserFollowers() async {
    try {
      var url = Uri.parse('https://api.github.com/users/$username/followers');
      var response = await http.get(url);
      return response;
    } catch (e) {
      log('An error occurred during the request: $e');
      throw Exception('HTTPs request failed: $e');
    }
  }
}
