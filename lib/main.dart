import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Authentication/authentication.dart';
import 'Bloc/AllRepos/all_repos_bloc.dart';
import 'Bloc/Branches/repo_branches_bloc.dart';
import 'Bloc/User/user_details_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<UserDetailsBloc>(create: (context) => UserDetailsBloc()),
    BlocProvider<AllReposBloc>(create: (context) => AllReposBloc()),
    BlocProvider<RepoBranchesBloc>(create: (context) => RepoBranchesBloc()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget entryPoint = LoginPage();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AnimatedSplashScreen(
              splash: Column(
                children: const [
                  Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/fir-music-56f40.appspot.com/o/images%2Flogotext.png?alt=media&token=490f34d4-a0bc-4625-998e-8ba9e5f185dd',
                          scale: 5))
                ],
              ),
              nextScreen: entryPoint),
        );
      },
    );
  }
}
