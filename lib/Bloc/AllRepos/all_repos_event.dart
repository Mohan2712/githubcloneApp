part of 'all_repos_bloc.dart';

abstract class AllReposEvent extends Equatable {
  const AllReposEvent();
}

class CheckAllRepos extends AllReposEvent {
  final username;
  const CheckAllRepos({required this.username});
  @override
  List<Object> get props => [username];
}
