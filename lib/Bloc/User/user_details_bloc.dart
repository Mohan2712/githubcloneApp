import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/Usermodel.dart';
import '../../Utils/String.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetails? entity;
  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<CheckUserDetails>((event, emit) async {
      try {
        entity = await repository.userGitDetails();
        emit(UserDetailsLoaded(entity: entity!));
      } catch (e) {
        print(e);
        emit(UserDetailsError(error: e.toString()));
      }
    });
  }
}
