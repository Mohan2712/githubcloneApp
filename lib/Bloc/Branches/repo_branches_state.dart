part of 'repo_branches_bloc.dart';

abstract class RepoBranchesState extends Equatable {
  const RepoBranchesState();
}

class RepoBranchesInitial extends RepoBranchesState {
  @override
  List<Object> get props => [];
}

class RepoBranchesLoaded extends RepoBranchesState {
  final List<AllBranches> entity;

  const RepoBranchesLoaded({required this.entity});

  @override
  List<Object> get props => [entity];
}

class RepoBranchesError extends RepoBranchesState {
  final String error;

  const RepoBranchesError({required this.error});

  @override
  List<Object> get props => [error];
}
