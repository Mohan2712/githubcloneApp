import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/Branches.dart';
import '../../Utils/String.dart';

part 'repo_branches_event.dart';
part 'repo_branches_state.dart';

class RepoBranchesBloc extends Bloc<RepoBranchesEvent, RepoBranchesState> {
  List<AllBranches>? entity;
  RepoBranchesBloc() : super(RepoBranchesInitial()) {
    on<CheckRepoBranches>((event, emit) async {
      try {
        entity =
            await repository.getAllRepoBranches(event.username, event.repoName);
        emit(RepoBranchesLoaded(entity: entity!));
      } catch (e) {
        print(e);
        emit(RepoBranchesError(error: e.toString()));
      }
    });
  }
}
