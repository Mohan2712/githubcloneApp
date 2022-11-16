import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/AllRepo.dart';
import '../../Utils/String.dart';

part 'all_repos_event.dart';
part 'all_repos_state.dart';

class AllReposBloc extends Bloc<AllReposEvent, AllReposState> {
  List<AllRepos>? entity;
  AllReposBloc() : super(AllReposInitial()) {
    on<CheckAllRepos>((event, emit) async {
      try {
        entity = await repository.getAllRepos(event.username);
        emit(AllReposLoaded(entity: entity!));
      } catch (e) {
        print(e);
        emit(AllReposError(error: e.toString()));
      }
    });
  }
}
