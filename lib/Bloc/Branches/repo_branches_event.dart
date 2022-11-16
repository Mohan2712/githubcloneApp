part of 'repo_branches_bloc.dart';

abstract class RepoBranchesEvent extends Equatable {
  const RepoBranchesEvent();
}

class CheckRepoBranches extends RepoBranchesEvent {
  final username;
  final repoName;
  const CheckRepoBranches({required this.username, required this.repoName});
  @override
  List<Object> get props => [username, repoName];
}
