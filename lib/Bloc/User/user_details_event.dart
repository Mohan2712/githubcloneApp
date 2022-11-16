part of 'user_details_bloc.dart';

abstract class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();
}

class CheckUserDetails extends UserDetailsEvent {
  const CheckUserDetails();
  @override
  List<Object> get props => [];
}
