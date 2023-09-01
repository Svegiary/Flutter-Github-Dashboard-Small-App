//This cubit implements the logic for switching the
//sorting method of the repos
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/github_repository.dart';

part 'repo_tab_state.dart';

class RepoTabCubit extends Cubit<RepoTabState> {
  late List<Repository> repositories; //late because we first need to get the user
  RepoTabCubit() : super(RepoTabAscending());

  void buttonPressed() {
    if (state is RepoTabAscending) {
      emit(RepoTabDescending()); //emit descending
    } else {
      emit(RepoTabAscending()); //emit ascending
    }
    repositories = repositories.reversed.toList(); //set the reversed list
  }

  void setRepos(List<Repository> repos) {
    //used to set the repos after the  user has been fetched
    repositories = repos;
  }
}
