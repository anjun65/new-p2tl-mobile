import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:p2tl/models/work_model.dart';
import 'package:p2tl/models/work_online_model.dart';
import 'package:p2tl/services/work_service.dart';

part 'work_event.dart';
part 'work_state.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  WorkBloc() : super(WorkInitial()) {
    on<WorkEvent>(
      (event, emit) async {
        if (event is WorkGet) {
          try {
            emit(WorkLoading());
            final works = await WorkService().getWork();
            emit(WorkSuccess(works));
          } catch (e) {
            emit(WorkFailed(e.toString()));
          }
        }

        if (event is WorkGetLocal) {
          // try {
          //   emit(WorkLoading());

          //   final works = await WorkService().getWorkLocal();

          //   emit(WorkSuccess(works));
          // } catch (e) {
          //   emit(WorkFailed(e.toString()));
          // }
        }

        if (event is AddWorkToLocal) {
          try {
            emit(WorkLoading());

            final res = await WorkService().addWorkToLocal(event.data);

            // emit(WorkSuccess(res));
          } catch (e) {
            print(e.toString());
            emit(WorkFailed(e.toString()));
          }
        }
      },
    );
  }
}
