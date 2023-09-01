//This creates a list view of repository cards
//If the user has no repos, print a no repos message

import 'package:assignment/frontend/widgets/repositories/repository_card.dart';
import 'package:assignment/logic/repo_tab_cubit/repo_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryTab extends StatelessWidget {
  const RepositoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoTabCubit, RepoTabState>(
      builder: (context, state) {
        RepoTabCubit repoTab = BlocProvider.of<RepoTabCubit>(context);
        if (repoTab.repositories.isNotEmpty) {
          //if the user has repos
          return Column(
            //return a column with a sort button
            //and the list of repositories
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    repoTab.buttonPressed(); //the cubit that updates the state
                    //when the button is pressed
                  },
                  icon: const Icon(Icons.sort)),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: repoTab.repositories.length,
                  prototypeItem: RepositoryCard(
                    //for performance
                    repository: repoTab.repositories[0],
                  ),
                  itemBuilder: (context, index) {
                    return RepositoryCard(repository: repoTab.repositories[index]);
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text("No Repositories"),
          );
        }
      },
    );
  }
}
