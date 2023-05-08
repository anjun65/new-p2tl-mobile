import 'package:p2tl/blocs/auth/auth_bloc.dart';
import 'package:p2tl/blocs/work/bloc/work_bloc.dart';
import 'package:p2tl/services/auth_service.dart';
import 'package:p2tl/shared/helpers.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:p2tl/ui/widgets/buttons.dart';
import 'package:p2tl/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:p2tl/models/database_instance.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    databaseInstance.database();
    getRoles();
    super.initState();
  }

  String? name;

  Future<void> getRoles() async {
    var new_name = await AuthService().getRoles();

    setState(() {
      name = new_name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 22,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/ic_edit_profile.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      name ?? "",
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/ic_history.png',
                      title: 'History',
                      onTap: () async {
                        Navigator.pushNamed(context, '/history');
                      },
                    ),
                    isLoading == false
                        ? ProfileMenuItem(
                            iconUrl: 'assets/ic_send.png',
                            title: 'Sync',
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              print("rer");
                              var item = await databaseInstance.getWork();

                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pushNamed(context, '/home');
                            },
                          )
                        : Container(
                            margin: const EdgeInsets.only(
                              bottom: 30,
                            ),
                            child: Row(
                              children: [
                                CircularProgressIndicator(),
                                const SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  'Loading ....',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ProfileMenuItem(
                      iconUrl: 'assets/ic_logout.png',
                      title: 'Log Out',
                      onTap: () {
                        context.read<AuthBloc>().add(AuthLogout());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 87,
              ),
            ],
          );
        },
      ),
    );
  }
}
