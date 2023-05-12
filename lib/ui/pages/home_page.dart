import 'package:p2tl/blocs/auth/auth_bloc.dart';
import 'package:p2tl/blocs/work/bloc/work_bloc.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/services/auth_service.dart';
import 'package:p2tl/shared/helpers.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2tl/ui/pages/add_work_page.dart';
import 'package:p2tl/ui/pages/detail_work_page.dart';
import 'package:p2tl/ui/pages/performa_page.dart';
import 'package:p2tl/ui/pages/target_page.dart';
import 'package:p2tl/ui/widgets/work_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseInstance? databaseInstance;

  String? roles;

  Future _refresh() async {
    setState(() {});
  }

  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  Future delete(int id) async {
    await databaseInstance!.delete(id);
    setState(() {});
  }

  Future<void> getRoles() async {
    var new_roles = await AuthService().getRoles();

    setState(() {
      roles = new_roles;
    });
  }

  @override
  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();

    getRoles();

    // TODO: implement initState
    super.initState();
  }

  int _current_index = 0;

  final List<Widget> screens = [
    PerformaPage(),
    TargetPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          currentIndex: _current_index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_statistic.png',
                width: 20,
                color: _current_index == 0 ? blueColor : greyColor,
              ),
              label: 'Performa',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                width: 20,
                color: _current_index == 1 ? blueColor : greyColor,
              ),
              label: 'Target Operasi',
            ),
          ],
          onTap: (index) {
            setState(() {
              _current_index = index;
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (roles == 'PETUGAS LAPANGAN') {
            Navigator.pushNamed(context, '/add-work-order').then((value) {
              setState(() {});
            });
          } else {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Menu Tidak bisa diakses"),
                content: const Text("Hanya bisa diakses oleh Petugas Lapangan"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      child: const Text("Oke"),
                    ),
                  ),
                ],
              ),
            );
          }
        },
        backgroundColor: purpleColor,
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[_current_index],
    );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(
              top: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo,',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      state.data.name.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: const AssetImage(
                          'assets/ic_edit_profile.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }

  // Widget buildLevel() {
  //   return RefreshIndicator(
  //     onRefresh: () async {},
  //     child: SingleChildScrollView(
  //       child: BlocProvider(
  //         create: (context) => WorkBloc()..add(WorkGetLocal()),
  //         child: BlocBuilder<WorkBloc, WorkState>(
  //           builder: (context, state) {
  //             if (state is WorkSuccess) {
  //               return Column(
  //                 children: state.works.map((work) {
  //                   return GestureDetector(
  //                     onTap: () {},
  //                     child: Container(
  //                       margin: const EdgeInsets.only(
  //                         top: 25,
  //                       ),
  //                       padding: const EdgeInsets.all(22),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(20),
  //                         color: whiteColor,
  //                         border: Border.all(
  //                           width: 2,
  //                           color: whiteColor,
  //                         ),
  //                       ),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Image.asset(
  //                             'assets/ic_house.png',
  //                             height: 50,
  //                           ),
  //                           Column(
  //                             crossAxisAlignment: CrossAxisAlignment.end,
  //                             children: [
  //                               Text(
  //                                 work.namaPelanggan!,
  //                                 style: blackTextStyle.copyWith(
  //                                   fontSize: 16,
  //                                   fontWeight: medium,
  //                                 ),
  //                               ),
  //                               const SizedBox(
  //                                 height: 2,
  //                               ),
  //                               Text(
  //                                 work.alamat!,
  //                                 style: greyTextStyle.copyWith(
  //                                   fontSize: 12,
  //                                 ),
  //                                 maxLines: 2,
  //                                 overflow: TextOverflow.ellipsis,
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   );
  //                 }).toList(),
  //               );
  //             }

  //             return const Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
}



  // Widget buildLevel() {
  //   return RefreshIndicator(
  //     onRefresh: () async {
  //       print('WWWWWWWWWWWWWWWWWWW');
  //     },
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           const SizedBox(
  //             height: 20.0,
  //           ),
  //           BlocProvider(
  //             create: (context) => WorkBloc()..add(WorkGet()),
  //             child: BlocBuilder<WorkBloc, WorkState>(
  //               builder: (context, state) {
  //                 if (state is WorkSuccess) {
  //                   children:
  //                   state.works.map(
  //                     (work) {
  //                       return WorkItem(
  //                         works: work,
  //                       );
  //                     },
  //                   ).toList();
  //                 }

  //                 return const Center(
  //                   child: CircularProgressIndicator(),
  //                 );
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
