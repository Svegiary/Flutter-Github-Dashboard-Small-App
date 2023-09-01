// This is the profile page for each user
// If the user is  not found it just prints a text messages
// saying user is not found.

import 'package:assignment/data/models/user.dart';
import 'package:assignment/frontend/widgets/followers/follower_tab.dart';
import 'package:assignment/frontend/widgets/repositories/repository_tab.dart';
import 'package:assignment/logic/repo_tab_cubit/repo_tab_cubit.dart';
import 'package:assignment/logic/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/tab_bar_cubit/tabbar_cubit.dart';
import '../widgets/profile_dashboard.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final tabCubit = BlocProvider.of<TabbarCubit>(context); //cubit for the tab bar
    late final GithubUser currentUser;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserLoaded) {
              //when the user is fetched
              BlocProvider.of<RepoTabCubit>(context).setRepos(state.user.repositories);
              //set the repository property for the RepoTabCubit
              //that handles the repository tab of the tab bar
            }
          },
          builder: (context, state) {
            if (state is UserLoading) {
              //if the user is being fetched
              return const Center(child: CircularProgressIndicator.adaptive());
              // show loading indicator
            } else if (state is UserLoaded) {
              currentUser = state.user;
              return Center(
                child: Column(
                  children: [
                    ProfileDashboard(
                      user: state.user,
                    ),
                    DefaultTabController(
                      //default tab controller for the tab bar
                      length: 3,
                      child: BlocBuilder<TabbarCubit, TabbarState>(
                        builder: (context, state) {
                          return TabBar(
                            tabs: const [
                              Tab(
                                text: 'Repositories',
                              ),
                              Tab(
                                text: 'Followers',
                              ),
                              Tab(
                                text: 'Bio',
                              ),
                            ],
                            onTap: (index) {
                              if (index == 0) {
                                tabCubit.firstTab();
                              } else if (index == 1) {
                                tabCubit.secondTab();
                              } else if (index == 2) {
                                tabCubit.thirdTab();
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<TabbarCubit, TabbarState>(
                        builder: (context, state) {
                          return IndexedStack(
                            //indexed stack for switching between the screens(widgets) and
                            index: state.index,
                            children: [
                              const RepositoryTab(), //the repo tab
                              FollowersTab(followers: currentUser.githubFollowers), //followers tab
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(child: Text(currentUser.bio)),
                              ), //the user's bio
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            } else if (state is UserNotFound) {
              //if the user is not found
              return const Center(
                //print user not found
                child: Text("No user found"),
              );
            } else if (state is HttpError) {
              //if it the http request failed
              //for instance when the user is not connected
              //to the internet
              return AlertDialog(
                //print an alert dialog
                actionsPadding: const EdgeInsets.fromLTRB(4, 0, 4, 2),
                contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); //return to previous screen
                      },
                      child: const Text("OK"))
                ],
                icon: const Icon(Icons.warning),
                content: const Text("Http error request. Check your internet connection"),
              );
            }
            return Container();
          },
        ));
  }
}
