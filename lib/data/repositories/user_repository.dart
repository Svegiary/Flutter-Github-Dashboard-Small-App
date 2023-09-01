// This is the local repository for the Github users
// It is where a user is created with their repos
// and followers. This is what will be used in our cubit logic

import 'dart:convert';

import 'package:assignment/data/providers/user_provider.dart';
import 'package:assignment/data/models/user.dart';

import '../models/github_repository.dart';

class UserRepository {
  const UserRepository();

  Future<GithubUser?> getUserInfo(String username) async {
    final userAPI = UserAPI(username: username);
    var response = await userAPI.getUserInfo(); //get the user info , but not the followers/repos
    if (response != null) {
      //if the request was successful
      Map<String, dynamic> jsonObject = json.decode(response.body); //decode the json
      GithubUser user = GithubUser.fromJson(jsonObject); //create a user with their basic info
      if (user.username != "No User") {
        //if the user exists
        user.setGithubFollowers(await _getFollowers(username)); //fetch their followers
        List<Repository> temp = await _getRepositories(username); //get their repos
        temp.sort((a, b) {
          //sort the repos by their starts in descending order
          //When the user wants to change the sorting behavior
          //we are not going to re-sort the list , but just reverse it
          return b.numberOfStars.compareTo(a.numberOfStars);
        });
        user.setRepositories(temp); //set Repos for the user
      }
      return user;
    }
    return null; //return null if the http request failed
  }

  Future<List<Repository>> _getRepositories(String username) async {
    //Private function for fetching the repositories
    final userAPI = UserAPI(username: username);
    var response = await userAPI.getUserRepos();
    List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Repository.fromJson(json)).toList();
  }

  Future<List<GithubUser>> _getFollowers(String username) async {
    //Private function for fetching the followers
    final userAPI = UserAPI(username: username);
    var response = await userAPI.getUserFollowers();

    List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => GithubUser.fromJson(json)).toList();
  }
}
