import 'package:p2tl/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2tl/ui/pages/add_work_page.dart';
import 'package:p2tl/ui/pages/history.dart';

import 'package:p2tl/ui/pages/splash_page.dart';
import 'package:p2tl/ui/pages/sign_in_page.dart';
import 'package:p2tl/ui/pages/home_page.dart';
import 'package:p2tl/ui/pages/profile_page.dart';

import 'blocs/auth/auth_bloc.dart';

import 'blocs/work/bloc/work_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrent()),
        ),
        BlocProvider(
          create: (context) => WorkBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => const SplashPage(),
          // '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/add-work-order': (context) => const AddWorkPage(),
          '/history': (context) => HistoryPage(),
        },
      ),
    );
  }
}
