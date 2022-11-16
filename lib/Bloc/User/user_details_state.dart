part of 'user_details_bloc.dart';

abstract class UserDetailsState extends Equatable {
  const UserDetailsState();
}

class UserDetailsInitial extends UserDetailsState {
  @override
  List<Object> get props => [];
}

class UserDetailsLoaded extends UserDetailsState {
  final UserDetails entity;

  const UserDetailsLoaded({required this.entity});

  @override
  List<Object> get props => [entity];
}

class UserDetailsError extends UserDetailsState {
  final String error;

  const UserDetailsError({required this.error});

  @override
  List<Object> get props => [error];
}
