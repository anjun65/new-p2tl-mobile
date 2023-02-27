part of 'work_bloc.dart';

abstract class WorkEvent extends Equatable {
  const WorkEvent();

  @override
  List<Object> get props => [];
}

class WorkGet extends WorkEvent {}

class WorkGetLocal extends WorkEvent {}

class AddWorkToLocal extends WorkEvent {
  final WorkModel data;
  const AddWorkToLocal(this.data);

  @override
  List<Object> get props => [data];
}
