import 'dart:async';

import 'package:p2tl/blocs/auth/auth_bloc.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }

        if (state is AuthFailed) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: lightBackgroundColor,
        body: Center(
          child: Container(
            width: 155,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/bright.png',
              ),
            )),
          ),
        ),
      ),
    );
  }
}
