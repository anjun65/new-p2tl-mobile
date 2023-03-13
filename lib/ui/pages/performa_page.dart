import 'package:fl_chart/fl_chart.dart';
import 'package:p2tl/blocs/auth/auth_bloc.dart';
import 'package:p2tl/blocs/work/bloc/work_bloc.dart';
import 'package:p2tl/models/database_instance.dart';
import 'package:p2tl/models/status_model.dart';
import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/shared/helpers.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2tl/ui/pages/detail_work_page.dart';
import 'package:p2tl/ui/widgets/text.dart';
import 'package:p2tl/ui/widgets/work_item.dart';
import 'indicator.dart';

class PerformaPage extends StatefulWidget {
  const PerformaPage({Key? key}) : super(key: key);

  @override
  State<PerformaPage> createState() => _PerformaPageState();
}

class _PerformaPageState extends State<PerformaPage> {
  DatabaseInstance? databaseInstance;
  int? touchedIndex;

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

  @override
  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              buildProfile(context),
              const SizedBox(
                height: 24.0,
              ),
              RefreshIndicator(
                onRefresh: _refresh,
                child: databaseInstance != null
                    ? FutureBuilder<StatusModel>(
                        future: databaseInstance!.workStatus(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return AspectRatio(
                              aspectRatio: 0.5,
                              child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(22),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: whiteColor,
                                      ),
                                      child: Column(
                                        children: [
                                          CustomTextField(
                                            title: 'Sudah dikerjakan',
                                            content:
                                                snapshot.data!.sudah.toString(),
                                          ),
                                          CustomTextField(
                                            title: 'Belum dikerjakan',
                                            content:
                                                snapshot.data!.belum.toString(),
                                          ),
                                          CustomTextField(
                                            title: 'TO',
                                            content:
                                                snapshot.data!.dalam.toString(),
                                          ),
                                          CustomTextField(
                                            title: 'Luar TO',
                                            content:
                                                snapshot.data!.luar.toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Indicator(
                                          color: const Color(0xff0293ee),
                                          text: 'Sudah',
                                          isSquare: false,
                                          size: touchedIndex == 0 ? 18 : 16,
                                          textColor: touchedIndex == 0
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                        Indicator(
                                          color: const Color(0xfff8b250),
                                          text: 'Belum',
                                          isSquare: false,
                                          size: touchedIndex == 1 ? 18 : 16,
                                          textColor: touchedIndex == 1
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: PieChart(
                                          PieChartData(
                                            pieTouchData: PieTouchData(),
                                            startDegreeOffset: 180,
                                            borderData: FlBorderData(
                                              show: false,
                                            ),
                                            sectionsSpace: 12,
                                            centerSpaceRadius: 0,
                                            sections: showingSectionsSB(
                                              snapshot.data!.sudah!,
                                              snapshot.data!.belum!,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Indicator(
                                          color: const Color(0xff845bef),
                                          text: 'TO',
                                          isSquare: false,
                                          size: touchedIndex == 2 ? 18 : 16,
                                          textColor: touchedIndex == 2
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                        Indicator(
                                          color: const Color(0xff13d38e),
                                          text: 'Luar TO',
                                          isSquare: false,
                                          size: touchedIndex == 3 ? 18 : 16,
                                          textColor: touchedIndex == 3
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: PieChart(
                                          PieChartData(
                                            pieTouchData: PieTouchData(),
                                            startDegreeOffset: 180,
                                            borderData: FlBorderData(
                                              show: false,
                                            ),
                                            sectionsSpace: 12,
                                            centerSpaceRadius: 0,
                                            sections: showingSectionsDL(
                                              snapshot.data!.dalam!,
                                              snapshot.data!.luar!,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: const CircularProgressIndicator(),
                            );
                          }
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      },
    );
  }

  List<PieChartSectionData> showingSectionsSB(
    int sudah,
    int belum,
  ) {
    return List.generate(
      2,
      (i) {
        final isTouched = i == touchedIndex;
        final double opacity = isTouched ? 1 : 0.6;
        double offset1 = 0.5;
        double offset2 = 0.5;

        if (sudah == 0) {
          offset2 = 0;
        }

        if (belum == 0) {
          offset1 = 0;
        }
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xff0293ee).withOpacity(opacity),
              value: sudah.toDouble(),
              title: sudah.toString(),
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff044d7c)),
              titlePositionPercentageOffset: offset1,
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xfff8b250).withOpacity(opacity),
              value: belum.toDouble(),
              title: belum.toString(),
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff90672d)),
              titlePositionPercentageOffset: offset2,
            );

          default:
            return PieChartSectionData();
        }
      },
    );
  }

  List<PieChartSectionData> showingSectionsDL(
    int dalam,
    int luar,
  ) {
    return List.generate(
      2,
      (i) {
        final isTouched = i == touchedIndex;
        final double opacity = isTouched ? 1 : 0.5;
        double offset1 = 0.5;
        double offset2 = 0.5;

        if (luar == 0) {
          offset2 = 0;
        }

        if (dalam == 0) {
          offset1 = 0;
        }
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xff845bef).withOpacity(opacity),
              value: dalam.toDouble(),
              title: dalam.toString(),
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: offset2,
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: luar.toDouble(),
              title: luar.toString(),
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: offset1,
            );

          default:
            return PieChartSectionData();
        }
      },
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
}
