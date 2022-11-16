import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/AllRepos/all_repos_bloc.dart';
import '../Bloc/User/user_details_bloc.dart';
import '../Models/AllRepo.dart';
import '../Models/Usermodel.dart';
import '../RepoDetailPage/RepoDetail.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  UserDetails? userDetails;
  List<AllRepos> allrepos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<UserDetailsBloc>.value(
          value: BlocProvider.of<UserDetailsBloc>(context, listen: false)
            ..add(CheckUserDetails()),
          child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
            builder: (context, state) {
              // if (state is UserDetailsInitial) {
              //   return initial();
              // }

              if (state is UserDetailsLoaded) {
                userDetails = state.entity;
                return homePageTopUi(userDetails!, context);
              }

              if (state is UserDetailsError) {
                return Text(state.error.toString());
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget initial() {
    return Container();
  }

  Widget homePageTopUi(UserDetails userDetails, BuildContext context) {
    return Column(
      children: [
        Text("GitHubClone"),
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 50,
            width: 50,
            child: Image(image: NetworkImage(userDetails.avatarUrl ?? ""))),
        SizedBox(
          height: 10,
        ),
        Text("${userDetails.login.toString()}"),
        SizedBox(
          height: 40,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ExpandablePanel(
                header: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                    child: Text(
                      "MY REPO",
                      // style: GoogleFonts.montserrat(
                      //   fontSize: AppSizes().paraMedium14,
                      //   color: Colors.black54,
                      // ),
                    ),
                  ),
                ),
                collapsed: Center(
                  child: Text(
                    "Click to view my repositories",
                    // style: GoogleFonts.montserrat(
                    //   fontSize: AppSizes().paraMedium14,
                    //   color: AppColors().curiousBlue,
                    // ),
                  ),
                ),
                expanded: allRepository(userDetails.login.toString(), context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget allRepository(String username, BuildContext context) {
    return BlocProvider<AllReposBloc>.value(
      value: BlocProvider.of<AllReposBloc>(context, listen: false)
        ..add(CheckAllRepos(username: username)),
      child: BlocBuilder<AllReposBloc, AllReposState>(
        builder: (context, state) {
          // if (state is UserDetailsInitial) {
          //   return initial();
          // }

          if (state is AllReposLoaded) {
            allrepos = state.entity;
            return homePageDownUi(allrepos, username);
          }

          if (state is AllReposError) {
            return Text(state.error.toString());
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget homePageDownUi(List<AllRepos> allrepository, String username) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: allrepository.length,
        padding: const EdgeInsets.only(top: 10.0),
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RepoDetails(
                              repoName: allrepository[index].name.toString(),
                              description:
                                  allrepository[index].description.toString(),
                              htmlUrl: allrepository[index].htmlUrl.toString(),
                              size: allrepository[index].size,
                              visibility: allrepository[index].visibility,
                              createdAt: allrepository[index].createdAt,
                              id: allrepository[index].id,
                              username: username,
                            ))),
                child: Text(allrepository[index].name.toString())),
          ));
        });
  }
}
