part of 'description_bloc.dart';

class DescriptionEvent extends Equatable {
  const DescriptionEvent();

  @override
  List<Object> get props => [];
}

class OnChangeIndex extends DescriptionEvent {
  final int index;

  const OnChangeIndex(this.index);
}

