// users.dart
// This is the model class for a Github User.
// This model is also used for the followers of each user.
// A follower has no followers of their own and no repos
// thus , the corresponding fields can be null

import 'package:assignment/data/models/github_repository.dart';

class GithubUser {
  final String username;
  List<GithubUser>? followers;
  final String imageURL;
  List<Repository>? repos;
  final String location;
  final String bio;
  final String amountOfFollowers;
  final String name;
  final String amountOfRepos;

  List<Repository> get repositories => repos ?? [];
  List<GithubUser> get githubFollowers => followers ?? [];
  void setRepositories(List<Repository> r) {
    repos = r;
  }

  void setGithubFollowers(List<GithubUser> f) => followers = f;

  GithubUser({
    required this.username,
    required this.imageURL,
    required this.location,
    required this.bio,
    required this.name,
    required this.amountOfRepos,
    required this.amountOfFollowers,
  });

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    //a from json factory

    return GithubUser(
      username: json['login'] ?? "No User", //if the username is null , then there is no such user
      imageURL: json['avatar_url'] ?? "No Image",
      location: json['location'] ?? "No Location",
      bio: json['bio'] ?? "No bio",
      name: json['name'] ?? "No name",
      amountOfRepos: json['public_repos'].toString(),
      amountOfFollowers: json['followers'].toString(),
    );
  }
}
