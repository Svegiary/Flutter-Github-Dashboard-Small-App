part of 'repo_tab_cubit.dart';

abstract class RepoTabState extends Equatable {
  const RepoTabState();

  @override
  List<Object> get props => [];
}

class RepoTabAscending extends RepoTabState {} //ascending

class RepoTabDescending extends RepoTabState {} //descending
