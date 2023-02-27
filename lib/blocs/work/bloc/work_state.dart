part of 'work_bloc.dart';

abstract class WorkState extends Equatable {
  const WorkState();

  @override
  List<Object> get props => [];
}

class WorkInitial extends WorkState {}

class WorkLoading extends WorkState {}

class WorkFailed extends WorkState {
  final String e;
  const WorkFailed(this.e);

  @override
  List<Object> get props => [e];
}

class WorkSuccess extends WorkState {
  final List<WorkOnlineModel> works;
  const WorkSuccess(this.works);

  @override
  List<Object> get props => [works];
}
