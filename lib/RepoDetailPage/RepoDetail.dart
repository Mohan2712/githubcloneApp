import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Branches/repo_branches_bloc.dart';
import '../Models/Branches.dart';

class RepoDetails extends StatelessWidget {
  String? repoName;
  String? description;
  String? htmlUrl;
  int? size;
  String? visibility;
  DateTime? createdAt;
  int? id;
  String? username;
  List<AllBranches> allBranches = [];
  RepoDetails(
      {required this.repoName,
      required this.description,
      required this.htmlUrl,
      required this.size,
      required this.visibility,
      required this.createdAt,
      required this.id,
      required this.username}); // const RepoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<RepoBranchesBloc>.value(
      value: BlocProvider.of<RepoBranchesBloc>(context, listen: false)
        ..add(CheckRepoBranches(username: username, repoName: repoName)),
      child: BlocBuilder<RepoBranchesBloc, RepoBranchesState>(
        builder: (context, state) {
          // if (state is UserDetailsInitial) {
          //   return initial();
          // }

          if (state is RepoBranchesLoaded) {
            allBranches = state.entity;
            return repoBranchUi(allBranches, username, repoName, size,
                description, visibility, htmlUrl, id, createdAt);
          }

          if (state is RepoBranchesError) {
            return Text(state.error.toString());
          }

          return CircularProgressIndicator();
        },
      ),
    ));
  }

  Widget repoBranchUi(
      List<AllBranches> allBranches,
      String? username,
      String? repoName,
      int? size,
      String? description,
      String? visibility,
      String? htmlUrl,
      int? id,
      DateTime? createdAt) {
    return Column(
      children: [
        Text(repoName ?? ""),
        Text(size.toString()),
        Text(createdAt.toString() ?? ""),
        ListView.builder(
            shrinkWrap: true,
            itemCount: allBranches.length,
            padding: const EdgeInsets.only(top: 10.0),
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(allBranches[index].name.toString()),
              ));
            }),
      ],
    );
  }
}
