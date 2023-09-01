//This widget dicates the design of the top portion of the profile
//Image, follower count , location and the user's username

import 'package:assignment/data/models/user.dart';
import 'package:assignment/frontend/widgets/info_bar.dart';
import 'package:flutter/material.dart';

class ProfileDashboard extends StatelessWidget {
  final GithubUser user;
  const ProfileDashboard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(400), boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.imageURL),
                ),
              ),
              InfoBar(user: user),
            ],
          ),
        ],
      ),
    );
  }
}
