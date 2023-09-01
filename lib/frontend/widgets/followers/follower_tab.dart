// This creates the list view of the followers
// The GitHub API only sends 30 followers back
// regardless of how many the user has.
// Dont know why this is , but it is something I noticed

import 'dart:developer';

import 'package:assignment/data/models/user.dart';
import 'package:assignment/frontend/widgets/followers/followers_card.dart';
import 'package:flutter/material.dart';

class FollowersTab extends StatelessWidget {
  final List<GithubUser> followers;
  const FollowersTab({super.key, required this.followers});

  @override
  Widget build(BuildContext context) {
    log(followers.length.toString());
    if (followers.isNotEmpty) {
      //if the user has followers
      return ListView.builder(
        //return a list of  the followers
        //with each item being a FollowersCard Widget
        itemCount: followers.length,
        prototypeItem: FollowersCard(follower: followers[0]), //for performance
        itemBuilder: (context, index) {
          return FollowersCard(follower: followers[index]);
        },
      );
    } else {
      //if the user does not have followers
      //return a No Followers Message
      return const Center(
        child: Text("No Followers"),
      );
    }
  }
}
