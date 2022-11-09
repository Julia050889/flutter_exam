part of 'description_bloc.dart';

class DescriptionState extends Equatable {
  final int currentIndex;
  PageController controller = PageController();

  DescriptionState({
    this.currentIndex = 0,
  });

  DescriptionState copyWith({
    int? currentIndex,
  }) {
    return DescriptionState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [
        currentIndex,
      ];
}
