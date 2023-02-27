import 'package:flutter/material.dart';
import 'package:p2tl/blocs/work/bloc/work_bloc.dart';
import 'package:p2tl/shared/helpers.dart';
import 'package:p2tl/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2tl/ui/pages/history_detail.dart';
import 'package:p2tl/ui/widgets/work_item.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        children: [
          BlocProvider(
            create: (context) => WorkBloc()..add(WorkGet()),
            child: BlocBuilder<WorkBloc, WorkState>(
              builder: (context, state) {
                if (state is WorkSuccess) {
                  return Column(
                    children: state.works.map((work) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (builder) {
                            return HistoryDetailPage(
                              work: work,
                            );
                          }));
                        },
                        child: WorkItem(
                          works: work,
                        ),
                      );
                    }).toList(),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
