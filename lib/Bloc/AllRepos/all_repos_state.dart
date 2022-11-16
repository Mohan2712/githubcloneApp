part of 'all_repos_bloc.dart';

abstract class AllReposState extends Equatable {
  const AllReposState();
}

class AllReposInitial extends AllReposState {
  @override
  List<Object> get props => [];
}

class AllReposLoaded extends AllReposState {
  final List<AllRepos> entity;

  const AllReposLoaded({required this.entity});

  @override
  List<Object> get props => [entity];
}

class AllReposError extends AllReposState {
  final String error;

  const AllReposError({required this.error});

  @override
  List<Object> get props => [error];
}
